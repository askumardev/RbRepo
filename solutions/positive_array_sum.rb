# ruby solutions/positive_array_sum.rb

nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]

positive_sum = nums.select { |num| num > 0 }.sum

puts "The sum of positive elements is: #{positive_sum}"

# nums = [-2,1,-3,4,-1,2,1,-5,4]
# positive = []
# negative = []
# nums.each do |num|
#   if num > 0
#     positive << num
#   else
#      negative << num
#   end
# end

# puts positive.sum