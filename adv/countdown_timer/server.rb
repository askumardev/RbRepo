# ruby adv/countdown_timer/server.rb
# http://localhost:4567/ in the browser

require 'webrick'

server = WEBrick::HTTPServer.new(Port: 4567)

html_path = File.join(__dir__, "timer.html")

server.mount_proc '/' do |req, res|
  res['Content-Type'] = 'text/html'
  res.body = File.read(html_path)
end

trap('INT') { server.shutdown }

server.start
