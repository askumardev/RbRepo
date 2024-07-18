# ruby adv/rack_demo.rb

require 'rack'
require 'thin'

class RackApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["<h3>Sample Rack App</h3>"]]
  end
end

@app = RackApp.new

# Start Thin server with the block syntax
Thin::Server.new('0.0.0.0', 3000) do
  use Rack::CommonLogger
  run @app
end.start
