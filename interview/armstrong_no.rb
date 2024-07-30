# Armstrong number is a number that is equal to the sum of cubes of its digits.
# For example 0, 1, 153, 370, 371 and 407

require 'pry'

# arm  = 153
# puts arm.to_s.split('').map(&:to_i).map { |x| x**3}.inject(:+) == arm

puts "Enter a number::"
num = gets.chomp.to_i
temp = num
sum = 0

while num != 0  #implementation of while loop
  rem = num % 10
  num = num / 10
  sum = sum + rem * rem * rem
end

if(temp == sum)
  puts "The #{temp} is Armstrong"
else
  puts "The #{temp} is not Armstrong"
end

# ruby interview/armstrong_no.rb