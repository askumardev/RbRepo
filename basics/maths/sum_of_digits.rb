# ruby basics/maths/sum_of_digits.rb

# Given a number, find sum of its digits.

def digits_sum(n)
  a = 0
  sum = 0
  until n.zero?
    a = n % 10
    sum += a
    n /= 10
  end
  sum
end

puts 'Sum of digits of 3456 is ' + digits_sum(3456).to_s
# Sum of digits of 3456 is 18
puts 'Sum of digits of 1234 is ' + digits_sum(1234).to_s
# Sum of digits of 1234 is 10
puts 'Sum of digits of 9251321 is ' + digits_sum(9_251_321).to_s
# Sum of digits of 9251321 is 23

p("--------------Alternate way---------")

num = 537
sum = 0

while num > 0
  sum = sum + (num%10)
  num = num/10
end
if num == 0 && sum > 0
  num = sum
  sum = 0
end

p num
