# ruby arr_hsh/add_digits.rb
require 'pry'
def add_digits(num)
  return num if num.to_s.length < 2
  arr = num.to_s.chars.map{|x| x.to_i}
  #arr = num.to_s.split("").map{|x| x.to_i}  ## Alternative
  sum = arr.inject(:+)
  add_digits(sum)
end

puts(add_digits(12))
puts(add_digits(123))
puts(add_digits(1234))
puts(add_digits(8))

# def add_digits1(num)
#   if num.to_s.length < 2
#     return num
#   end
#   digits_to_sum = num.to_s.split('')
#   sum = 0
#   digits_to_sum.each do |num|
#     sum += num.to_i
#   end
#   add_digits1(sum)
# end

# puts(add_digits1(38))# # => 2
# puts(add_digits1(284))# # => 5


# Challenge name: Add Digits
#
# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
#
# Example:
#
# Input: 38
# Output: 2
# Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
#              Since 2 has only one digit, return it.
#
# Follow up:
# Could you do it without any loop/recursion in O(1) runtime?
# @param {Integer} num
# @return {Integer}

#
# Approach 1: Recursion
#
# Time complexity: O(n)
