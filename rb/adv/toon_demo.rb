# ruby adv/toon_demo.rb

require 'net/http'
require 'json'
require 'uri'

# Convert Hash → TOON
def to_toon(obj)
  case obj
  when Hash
    "{#{obj.map { |k, v| "#{k}=#{to_toon(v)}" }.join(";")};}"
  when Array
    "[#{obj.map { |v| to_toon(v) }.join}]"
  else
    obj.to_s
  end
end

# Real API call
begin
  uri = URI("https://jsonplaceholder.typicode.com/posts/1")
  res = Net::HTTP.get_response(uri)

  if res.is_a?(Net::HTTPSuccess)
    data = JSON.parse(res.body)
    puts "response#{to_toon(data)}"
  else
    puts "response{status=error;code=#{res.code};}"
  end
rescue => e
  puts "response{status=error;message=#{e.message};}"
end

#
