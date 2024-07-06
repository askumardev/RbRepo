#ruby solutions\frequent.rb

inp = "346555578123999021344"
puts inp.chars.chunk{|e| e}.map{
  |e| e[1].join if e[1].size >1
}.compact.inspect

puts("--------------------------------------------------")
# Find Most Frequently Occurring Element in an Array With Ruby
arr = [1, 2, 3, 4, 5, 5, 5, 6, 6,6,6,6, 7, 7, 7, 7]
most_frequent = arr.group_by(&:itself).max_by { |_, v| v.size }.first
puts most_frequent
