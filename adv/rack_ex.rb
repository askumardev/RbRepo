require 'rack'
require 'rackup'
require 'thin'
require 'rackup/handler/thin'

class JSONServer
  def call(_env)
    [200, { 'Content-Type' => 'application/json' }, ['{ "message" : "Hello!" }']]
  end
end

class RackLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    @start = Time.now
    @status, @headers, @body = @app.call(env)
    @duration = ((Time.now - @start).to_f * 1000).round(2)

    puts "#{env['REQUEST_METHOD']} #{env['REQUEST_PATH']} - Took: #{@duration} ms"
    [@status, @headers, @body]
  end
end

app = Rack::Builder.new do
  use RackLogger

  map '/hello.json' do
    run JSONServer.new
  end
end

Rackup::Handler::Thin.run(app, Port: 9292)

# bundle exec ruby adv/rack_ex.rb
# http://localhost:9292/hello.json