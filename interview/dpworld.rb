# ruby interview/dpworld.rb

require 'httparty'
require 'openssl'
require 'json'
require 'pry'

# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# url = "https://demo2459056.mockable.io/url"
# json = HTTParty.get(url)
# a = JSON.parse(json.body)
# selected_values = a["data"].map { |x| { "city" => x["city"], "cost" =>x["estimated_cost"] } }#.group_by{|x| x["city"], avg(x["cost"])}
# #p selected_values
# grouped_data = selected_values.group_by { |entry| entry["city"] }
# #p grouped_data

# # Calculate average cost for each city and format the result
# average_costs = grouped_data.map do |city, entries|
#   avg_cost = entries.sum { |entry| entry["cost"] } / entries.length.to_f
#   {"city" => city, "avg" => avg_cost}
# end
# puts average_costs


p("-------------2nd round---------")
# arr = [0,-1,2,-3,1]
# target = 2

# arr.permutation(2) do |x|
# #[[0,2],[2,0]]
#  p x.first if x.inject(:+) == target
# end
p"-------------------------------------"
arr = [3, 3, 5, 5, 5, 10, 4, 6, 6]
target = 10

combinations = []

for i in 0...(arr.length - 1)  # Outer loop
  for j in (i + 1)...arr.length  # Inner loop
    if arr[i] + arr[j] == target
      combination = [arr[i], arr[j]].sort
      combinations << combination unless combinations.include?(combination)
    end
  end
end

p combinations

arr = [1,2,5,7,13,11,-2]
target = 9
new = []
arr = arr.combination(2)
arr.each do |a|
  new << a if a.sum == target
end
p new


p "-----------"
arr = [1, 2, 5, 7, 13, 11, -2]
target = 9
new_pairs = []

# Iterate through each pair of elements
arr.each_with_index do |num1, i|
  arr.each_with_index do |num2, j|
    # Make sure we don't use the same element twice
    if i != j && num1 + num2 == target

      pair = [num1, num2].sort
      new_pairs << pair unless new_pairs.include?(pair)
    end
  end
end

p new_pairs
