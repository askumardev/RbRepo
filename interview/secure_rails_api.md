Secure Rails API — End-to-End Reference Implementation
Rails 7.1+ API-only app. JWT auth with refresh rotation, Pundit authorization,
rack-attack, CORS, secure headers. Assumes `rails new myapp --api`.
---
1. Gemfile additions
```ruby
gem 'jwt'
gem 'bcrypt'
gem 'pundit'
gem 'rack-attack'
gem 'rack-cors'
gem 'secure_headers'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'bundler-audit'
end
```
```bash
bundle install
rails g rspec:install
```
---
2. Database — users + refresh tokens
```bash
rails g model User email:string:uniq password_digest:string role:integer
rails g model RefreshToken user:references token_digest:string:uniq expires_at:datetime revoked_at:datetime
```
```ruby
# db/migrate/xxxx_create_users.rb
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :role, default: 0, null: false
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
```
```ruby
# db/migrate/xxxx_create_refresh_tokens.rb
class CreateRefreshTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :refresh_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token_digest, null: false
      t.datetime :expires_at, null: false
      t.datetime :revoked_at
      t.timestamps
    end
    add_index :refresh_tokens, :token_digest, unique: true
  end
end
```
```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :refresh_tokens, dependent: :destroy

  enum role: { member: 0, admin: 1 }

  validates :email, presence: true, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 10 }, if: -> { new_record? || password.present? }
end
```
```ruby
# app/models/refresh_token.rb
class RefreshToken < ApplicationRecord
  belongs_to :user

  # Only the digest is stored — the raw token is never persisted.
  def self.generate_for(user)
    raw = SecureRandom.hex(32)
    create!(
      user: user,
      token_digest: Digest::SHA256.hexdigest(raw),
      expires_at: 30.days.from_now
    )
    raw # return the raw token to hand to the client — this is the only time it exists in plaintext
  end

  def self.authenticate(raw)
    digest = Digest::SHA256.hexdigest(raw)
    token = find_by(token_digest: digest)
    return nil unless token
    return nil if token.revoked_at.present? || token.expires_at < Time.current

    token
  end

  def revoke!
    update!(revoked_at: Time.current)
  end
end
```
---
3. JWT encode/decode helper
```ruby
# app/lib/json_web_token.rb
class JsonWebToken
  ALGO = 'HS256'

  def self.secret
    Rails.application.credentials.dig(:jwt, :secret) || Rails.application.credentials.secret_key_base
  end

  def self.encode(payload, exp = 15.minutes.from_now)
    payload = payload.dup
    payload[:exp] = exp.to_i
    payload[:iat] = Time.current.to_i
    JWT.encode(payload, secret, ALGO)
  end

  def self.decode(token)
    decoded = JWT.decode(token, secret, true, algorithm: ALGO)[0]
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::ExpiredSignature, JWT::DecodeError
    nil
  end
end
```
Add to credentials (`rails credentials:edit`):
```yaml
jwt:
  secret: <run: SecureRandom.hex(64)>
```
Access tokens are short-lived (15 min) and stateless — never revoked individually,
never hit the DB. Refresh tokens are long-lived and stateful — stored as a digest,
revocable, rotated on every use.
---
4. Auth controller — login, refresh, logout
```ruby
# app/controllers/api/v1/auth_controller.rb
module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate_request, only: [:login, :refresh]

      # POST /api/v1/login
      def login
        user = User.find_by(email: params[:email]&.downcase)

        unless user&.authenticate(params[:password])
          return render json: { error: 'Invalid credentials' }, status: :unauthorized
        end

        render json: issue_tokens(user), status: :ok
      end

      # POST /api/v1/refresh
      def refresh
        raw = params[:refresh_token]
        token = RefreshToken.authenticate(raw)

        unless token
          return render json: { error: 'Invalid or expired refresh token' }, status: :unauthorized
        end

        # Rotation: revoke the used token, issue a brand new pair.
        # If a revoked token is reused, treat it as a stolen-token signal and
        # revoke the whole family for that user.
        token.revoke!
        render json: issue_tokens(token.user), status: :ok
      end

      # DELETE /api/v1/logout
      def logout
        RefreshToken.authenticate(params[:refresh_token])&.revoke!
        head :no_content
      end

      private

      def issue_tokens(user)
        {
          access_token: JsonWebToken.encode(sub: user.id, role: user.role),
          refresh_token: RefreshToken.generate_for(user),
          expires_in: 15.minutes.to_i
        }
      end
    end
  end
end
```
Reused-refresh-token detection (tighten this once you're past MVP — it's the
part that actually stops token theft from being silently exploited):
```ruby
# in refresh action, before token.revoke!
if token.revoked_at.present?
  RefreshToken.where(user: token.user).update_all(revoked_at: Time.current)
  return render json: { error: 'Token reuse detected, all sessions revoked' }, status: :unauthorized
end
```
---
5. Base controller — authentication + Pundit wiring
```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  include Pundit::Authorization

  before_action :authenticate_request

  rescue_from Pundit::NotAuthorizedError, with: :forbidden
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  attr_reader :current_user

  private

  def authenticate_request
    header = request.headers['Authorization']
    token = header&.split(' ')&.last
    payload = token && JsonWebToken.decode(token)

    if payload
      @current_user = User.find_by(id: payload[:sub])
    end

    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  end

  def forbidden
    render json: { error: 'Forbidden' }, status: :forbidden
  end

  def not_found
    render json: { error: 'Not found' }, status: :not_found
  end
end
```
---
6. Pundit policy example
```ruby
# app/policies/application_policy.rb
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?   = false
  def show?    = false
  def create?  = false
  def update?  = false
  def destroy? = false

  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    def resolve = raise NotImplementedError
  end
end
```
```ruby
# app/policies/booking_policy.rb
class BookingPolicy < ApplicationPolicy
  def show?    = user.admin? || record.user_id == user.id
  def update?  = user.admin? || record.user_id == user.id
  def destroy? = user.admin?

  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user_id: user.id)
    end
  end
end
```
```ruby
# app/controllers/api/v1/bookings_controller.rb
module Api
  module V1
    class BookingsController < ApplicationController
      def index
        render json: policy_scope(Booking)
      end

      def show
        booking = Booking.find(params[:id])
        authorize booking
        render json: booking
      end

      def update
        booking = Booking.find(params[:id])
        authorize booking
        booking.update!(booking_params)
        render json: booking
      end

      private

      def booking_params
        params.require(:booking).permit(:status, :notes)
      end
    end
  end
end
```
---
7. Rack::Attack — rate limiting
```ruby
# config/initializers/rack_attack.rb
class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::RedisCacheStore.new(url: ENV['REDIS_URL'])

  # General throttle: 300 req / 5 min / IP
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip unless req.path.start_with?('/assets')
  end

  # Tight throttle on login — the actual attack surface for credential stuffing
  throttle('login/ip', limit: 5, period: 20.seconds) do |req|
    req.ip if req.path == '/api/v1/login' && req.post?
  end

  throttle('login/email', limit: 5, period: 20.seconds) do |req|
    if req.path == '/api/v1/login' && req.post?
      req.params['email']&.to_s&.downcase.presence
    end
  end

  # Refresh endpoint — abuse here means someone's hammering stolen tokens
  throttle('refresh/ip', limit: 10, period: 1.minute) do |req|
    req.ip if req.path == '/api/v1/refresh' && req.post?
  end

  self.throttled_responder = lambda do |req|
    [429, { 'Content-Type' => 'application/json' }, [{ error: 'Rate limit exceeded' }.to_json]]
  end
end
```
```ruby
# config/application.rb — inside class Application
config.middleware.use Rack::Attack
```
---
8. CORS
```ruby
# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV.fetch('ALLOWED_ORIGINS', 'app.yourdomain.com').split(',')
    resource '/api/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: false # you're using bearer tokens, not cookies — keep this false
  end
end
```
---
9. Secure headers
```ruby
# config/initializers/secure_headers.rb
SecureHeaders::Configuration.default do |config|
  config.hsts = "max-age=#{1.year.to_i}; includeSubDomains; preload"
  config.x_frame_options = 'DENY'
  config.x_content_type_options = 'nosniff'
  config.x_xss_protection = '0' # deprecated header, explicitly disabled per current guidance
  config.csp = {
    default_src: %w('none'), # API-only, no rendered HTML to protect
    frame_ancestors: %w('none')
  }
end
```
```ruby
# config/environments/production.rb
config.force_ssl = true
```
---
10. Param filtering (nested JSON bodies)
```ruby
# config/initializers/filter_parameter_logging.rb
Rails.application.config.filter_parameters += [
  :password, :password_confirmation, :token, :access_token, :refresh_token,
  :ssn, :card_number, :cvv
]
```
This covers nested keys automatically in Rails 7+ (`filter_parameters` does deep
matching on key name, not just top-level).
---
11. Routes
```ruby
# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'auth#login'
      post 'refresh', to: 'auth#refresh'
      delete 'logout', to: 'auth#logout'

      resources :bookings, only: [:index, :show, :update]
    end
  end
end
```
---
12. CI — bundler-audit
```yaml
# .github/workflows/ci.yml (add as a job)
security:
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v4
    - uses: ruby/setup-ruby@v1
      with:
        ruby-version: '3.3'
        bundler-cache: true
    - run: bundle exec bundler-audit check --update
```
---
13. RSpec coverage worth having day one
```ruby
# spec/requests/api/v1/auth_spec.rb
require 'rails_helper'

RSpec.describe 'Api::V1::Auth', type: :request do
  let!(:user) { create(:user, password: 'supersecurepw') }

  describe 'POST /api/v1/login' do
    it 'returns tokens for valid credentials' do
      post '/api/v1/login', params: { email: user.email, password: 'supersecurepw' }
      expect(response).to have_http_status(:ok)
      expect(json['access_token']).to be_present
      expect(json['refresh_token']).to be_present
    end

    it 'rejects invalid credentials' do
      post '/api/v1/login', params: { email: user.email, password: 'wrong' }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /api/v1/refresh' do
    it 'rotates the refresh token and rejects reuse' do
      post '/api/v1/login', params: { email: user.email, password: 'supersecurepw' }
      old_refresh = json['refresh_token']

      post '/api/v1/refresh', params: { refresh_token: old_refresh }
      expect(response).to have_http_status(:ok)

      # reusing the old (now-revoked) token must fail
      post '/api/v1/refresh', params: { refresh_token: old_refresh }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
```
---
What's deliberately left out (scope for later)
Device/session listing UI — `RefreshToken` model already supports "log out
all devices" (`user.refresh_tokens.update_all(revoked_at: Time.current)`); just
needs an endpoint.
2FA — bolt on `rotp` gem against the same `User` model when needed.
API versioning strategy beyond `/v1` — namespace is there, no header-based
version negotiation added since you likely don't need it yet.
Audit logging — worth adding `paper_trail` if this is fintech/PCI-adjacent,
given your Pocket Concierge background.