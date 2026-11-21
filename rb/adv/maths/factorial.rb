# ruby adv/maths/factorial.rb

=begin
A ruby program calculate factorial of a given number.
Mathematical Explanation: The factorial of a number is the product of all the integers from 1 to that number.
i.e: n! = n*(n-1)*(n-2)......*2*1
=end

#
# Approach: Interative
#

def factorial(n)
  return 1 if n == 0
  n.downto(1).inject(:*)
end

puts '4! = ' + factorial(4).to_s
# 4! = 24

puts '0! = ' + factorial(0).to_s
# 0! = 1

puts '10! = ' + factorial(10).to_s
# 10! = 3628800

p "------------------"

# def fact(n)
#   return 1 if n == 0
#   n.downto(1).inject(:*)
# end
def fact(n)
  raise ArgumentError, "Factorial not defined for negative numbers" if n < 0
  (1..n).inject(1, :*)
end

p fact(5)
p fact(0)
p fact(-3)

p "---------recursive-------"
def fact(n)
  return 1 if n <= 1
  n * fact(n - 1)
end
p fact(5)
p fact(0)
