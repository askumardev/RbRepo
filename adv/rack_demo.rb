# bundle exec ruby adv/rack_demo.rb

require 'rack'
require 'thin'

class RackApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["<h3>Sample Rack App</h3>"]]
  end
end

app = RackApp.new

rack_app = Rack::Builder.new do
  use Rack::CommonLogger
  run app
end.to_app

Thin::Server.new('0.0.0.0', 3000, rack_app).start


Each middleware passes the request inward and receives the response back 
outward. It does not pass the response to the next middleware.

For your Rails middleware stack:
Request:  A → B → C → Rails Router → Controller

Response: A ← B ← C ← Rails Router ← Controller


Here is the actual calling pattern:
def call(env)
  # 1. Process incoming request

  status, headers, body = @app.call(env)

  # 2. Process response received from downstream

  [status, headers, body]
end


# rails -v
# Rails 7.2.4

# rails middleware
# use Rack::MiniProfiler
# use ActionDispatch::HostAuthorization
# use Rack::Sendfile
# use ActionDispatch::Static
# use ActionDispatch::Executor
# use ActionDispatch::ServerTiming
# use ActiveSupport::Cache::Strategy::LocalCache::Middleware
# use Rack::Runtime
# use Rack::MethodOverride
# use ActionDispatch::RequestId
# use ActionDispatch::RemoteIp
# use Sprockets::Rails::QuietAssets
# use Rails::Rack::Logger
# use ActionDispatch::ShowExceptions
# use WebConsole::Middleware
# use ActionDispatch::DebugExceptions
# use ActionDispatch::ActionableExceptions
# use ActionDispatch::Reloader
# use ActionDispatch::Callbacks
# use ActiveRecord::Migration::CheckPending
# use ActionDispatch::Cookies
# use ActionDispatch::Session::CookieStore
# use ActionDispatch::Flash
# use ActionDispatch::ContentSecurityPolicy::Middleware
# use ActionDispatch::PermissionsPolicy::Middleware
# use Rack::Head
# use Rack::ConditionalGet
# use Rack::ETag
# use Rack::TempfileReaper
# run PracRails::Application.routes


# When Middleware A calls @app.call(env), it invokes Middleware B. Middleware B invokes C, and so on.

# Once the controller generates a response:
# - Middleware C receives status, headers, and body.
# - Middleware B receives the response returned by C.
# - Middleware A receives the response returned by B.
# - Puma receives the final response.
# Interview takeaway: env flows inward; status, headers, body flow outward.

# require 'rack'
# require 'rackup'
# require 'thin'
# require 'rackup/handler/thin'

# class JSONServer
#   def call(_env)
#     [200, { 'Content-Type' => 'application/json' }, ['{ "message" : "Hello!" }']]
#   end
# end

# class RackLogger
#   def initialize(app)
#     @app = app
#   end

#   def call(env)
#     @start = Time.now
#     @status, @headers, @body = @app.call(env)
#     @duration = ((Time.now - @start).to_f * 1000).round(2)

#     puts "#{env['REQUEST_METHOD']} #{env['REQUEST_PATH']} - Took: #{@duration} ms"
#     [@status, @headers, @body]
#   end
# end

# app = Rack::Builder.new do
#   use RackLogger

#   map '/hello.json' do
#     run JSONServer.new
#   end
# end

# Rackup::Handler::Thin.run(app, Port: 9292)

# bundle exec ruby adv/rack_ex.rb
# http://localhost:9292/hello.json

# https://www.youtube.com/watch?v=C4wy8L--FmE
# 1. Introduction & The Problem Rack Solves
# Context for Rails Developers: Even if developers haven't directly worked with Rack, Ruby on Rails uses it behind the scenes [
# 00:01
# Opens in a new window].

# The Traditional Architecture Flow: When a user enters a URL, the HTTP request goes through the following chain:

# Browser → Web Server (e.g., Nginx) → Application Server (e.g., Puma) → Application Framework (e.g., Ruby on Rails) [
# 00:57
# Opens in a new window].

# The Complexity Challenge: Before Rack, every application server needed to understand the specific APIs and interfaces of every application framework, and vice versa. As the number of servers (Puma, Unicorn, Thin, WEBrick) and frameworks (Rails, Sinatra) grew, the communication matrix became extremely complex [
# 01:38
# Opens in a new window].

# The Solution: Rack acts as a standardized protocol and interface between web application servers and Ruby applications. As long as both sides adhere to the Rack protocol, they can seamlessly communicate with one another [
# 03:16
# Opens in a new window].

# 2. Building a Basic Rack Application
# To demonstrate how Rack works without a framework, a simple app can be built in a Ruby environment using a rack-up script (config.ru) [
# 04:17
# Opens in a new window]:

# The Core Requirements of a Rack App:

# Defined inside a class or module (e.g., class App) [
# 04:31
# Opens in a new window].

# Must implement a call method that accepts an environment hash (env) [
# 04:42
# Opens in a new window].

# Must return an Array consisting of three elements:

# Status Code: (e.g., 200 for success) [
# 05:03
# Opens in a new window]

# Headers Hash: (e.g., {'Content-Type' => 'text/html'}) [
# 05:12
# Opens in a new window]

# Response Body: (wrapped in an array containing strings, e.g., ["<h1>Hello World</h1>"]) [
# 05:20
# Opens in a new window]

# Running the Application:

# Using a web server like Puma, you can run puma in the directory containing the config.ru file to start a local server (typically on port 9292) [
# 06:32
# Opens in a new window].

# 3. What the Rack Gem Provides
# Beyond just a protocol specification, the rack gem provides several helpful utilities and tools:

# Middleware Pipeline (use, use DSL):

# Middleware components sit between the application server and your main application like a pipeline of functions [
# 09:07
# Opens in a new window].

# They handle peripheral/cross-cutting concerns (such as logging, authentication, session management) before passing the request down to the next middleware or the final app [
# 09:21
# Opens in a new window].

# Request and Response Classes:

# Convenient APIs that wrap the raw env hash to make reading HTTP requests and writing responses much easier [
# 10:16
# Opens in a new window].

# Mock Request:

# Tools built specifically for testing Rack applications without spinning up an actual network server [
# 10:24
# Opens in a new window].

# The rackup Command:

# Abstracts away the underlying web server [
# 10:39
# Opens in a new window]. Instead of hardcoding a specific server command like puma, developers can run rackup to swap out servers (e.g., switching from Puma to Thin or Unicorn) without modifying the app code [
# 11:03
# Opens in a new window].

# Rack DSL (Domain Specific Language):

# Provides intuitive methods inside config.ru files such as:

# run [
# 11:25
# Opens in a new window] (to execute the main application)

# map [
# 11:25
# Opens in a new window] (to act as a simple router)

# use [
# 11:25
# Opens in a new window] (to include middleware layers) [
# 11:31
# Opens in a new window]