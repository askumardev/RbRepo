# Write a program that outputs the string representation of numbers from 1 to n.

# But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

# Example:

# n = 15,

# Return:
# [
#     "1",
#     "2",
#     "Fizz",
#     "4",
#     "Buzz",
#     "Fizz",
#     "7",
#     "8",
#     "Fizz",
#     "Buzz",
#     "11",
#     "Fizz",
#     "13",
#     "14",
#     "FizzBuzz"
# ]

def fizz_buzz(n)
  a = []
  
  (1..n).each_with_index do |num|
    if num % 15 == 0
      a << 'FizzBuzz'
    elsif num % 3 == 0
      a << 'Fizz'
    elsif num % 5 == 0
      a << 'Buzz'
    else
      a << num.to_s
    end
  end
  
  a
end