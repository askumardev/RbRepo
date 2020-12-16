# frozen_string_literal: true

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

use RackLogger

map '/hello.json' do
  run JSONServer.new
end
