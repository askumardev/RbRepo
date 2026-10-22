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


Each middleware passes the request inward and receives the response back outward. It does not pass the response to the next middleware.

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


# When Middleware A calls @app.call(env), it invokes Middleware B. Middleware B invokes C, and so on.

# Once the controller generates a response:
# - Middleware C receives status, headers, and body.
# - Middleware B receives the response returned by C.
# - Middleware A receives the response returned by B.
# - Puma receives the final response.
# Interview takeaway: env flows inward; status, headers, body flow outward.