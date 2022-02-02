require 'uri'
require 'net/http'
require 'httparty'

uri = URI('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY')
res = Net::HTTP.get_response(uri)
puts res.body if res.is_a?(Net::HTTPSuccess)


#-----------------------------------
puts("*******httparty********")
response = HTTParty.get('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY')
puts response.body if response.code == 200
