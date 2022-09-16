puts "Enter a number::"
num = gets.chomp.to_i
#puts arm.to_s.split('').map(&:to_i).map { |x| x**3}.inject(:+) == arm
temp = num
sum = 0

while num != 0  #implementation of while loop
  rem = num%10
  num = num/10
  sum = sum + rem * rem * rem
end

if(temp == sum)
  puts "The #{temp} is Armstrong"
else
  puts "The #{temp} is not Armstrong"
end

# ruby interview/armstrong_no.rb