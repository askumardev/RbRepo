# ruby interview/dpworld.rb

require 'httparty'
require 'json'
require 'pry'

url = "https://demo2459056.mockable.io/url"
json = HTTParty.get(url)
a = JSON.parse(json.body)
selected_values = a["data"].map { |x| { "city" => x["city"], "cost" =>x["estimated_cost"] } }#.group_by{|x| x["city"], avg(x["cost"])}
#p selected_values
grouped_data = selected_values.group_by { |entry| entry["city"] }
#p grouped_data

# Calculate average cost for each city and format the result
average_costs = grouped_data.map do |city, entries|
  avg_cost = entries.sum { |entry| entry["cost"] } / entries.length.to_f
  {"city" => city, "avg" => avg_cost}
end
puts average_costs
p("-------------2nd round---------")
arr = [0,-1,2,-3,1]
target = 2 

arr.permutation(2) do |x|
#[[0,2],[2,0]]
 p x.first if x.inject(:+) == target 
end
p"-------------------------------------"
arr = [1,2,5,7,13,11,-2]
target = 9
new = []
arr = arr.combination(2)
arr.each do |a|
  new << a if a.sum == target
end
p new
