# ruby interview/fizzbuzz.rb


def fizz_buzz(n)
  str = []

  n.times do |i|
    i += 1

    if i % 5 == 0 && i % 3 == 0
      str.push('FizzBuzz')
    elsif i % 3 == 0
      str.push('Fizz')
    elsif i % 5 == 0
      str.push('Buzz')
    else
      str.push(i.to_s)
    end
  end

  str
end

n = 15
fizz_buzz(n)

def fizz_buzz(n)
  str = []

  n.times do |i|
    i += 1
    num_str = ''

    num_str += 'Fizz' if i % 3 == 0
    num_str += 'Buzz' if i % 5 == 0

    num_str = i.to_s if num_str == ''

    str.push(num_str)
  end

  str
end

n = 15
puts(fizz_buzz(n))

# def fizbuz(n)
#   hash = {}
#   1.upto(n).each do |x|
#     hash[x] = if (x % 15).zero?
#                 'fizzbuzz'
#               elsif (x % 3).zero?
#                 'fizz'
#               elsif (x % 5).zero?
#                 'buzz'
#               else
#                 x
#               end
#   end
#   puts hash
# end

# fizbuz(15)


# (1..50).each do |x|
#   m3 = x.modulo(3) == 0
#   m5 = x.modulo(5) == 0

#   puts case
#     when (m3 and m5) then 'FizzBuzz'
#     when m3 then 'Fizz'
#     when m5 then 'Buzz'
#     else x
#   end
# end

# (1..15).each{|i|
#    x = ''
#    x += 'Fizz' if i%3==0
#    x += 'Buzz' if i%5==0
#   puts(x.empty? ? i : x);
# }

def hashed_fizz_buzz(num)
  hash = {}

  1.upto(num).each do |e|
    hash[e] = if (e % 5).zero? && (e % 3).zero?
                'FizzBuzz'
              elsif (e % 5).zero?
                'Buzz'
              elsif (e % 3).zero?
                'Fizz'
              else
                e
              end
  end

  puts hash
end
hashed_fizz_buzz 15

# def fizzbuzz(num)
#   1.upto(num).each do |x|
#     if x%3 == 0 && x%5 == 0
#       p "fizzbuzz"
#     elsif x % 5 == 0
#       p "buzz"
#     elsif x % 3 == 0
#       p "fizz"
#     else
#       p x
#     end
#   end
# end

# fizzbuzz(15)



# Write a program that outputs the string representation of numbers
# from 1 to n. But for multiples of three it should output “Fizz”
# instead of the number and for the multiples of five output “Buzz”.
# For numbers which are multiples of both three and five output
# “FizzBuzz”.

#
# Approach 1: Naive Approach
#

# Complexity Analysis

# Time Complexity: O(N)
# Space Complexity: O(1)

# @param {Integer} n
# @return {String[]}
#
# Approach 2: String Concatenation
#

# Algorithm
#
# Instead of checking for every combination of these conditions,
# check for divisibility by given numbers i.e. 3, 5 as given in the
# problem. If the number is divisible, concatenate the corresponding
# string mapping Fizz or Buzz to the current answer string.
#
# For eg. If we are checking for the number 15, the steps would be:
#
# Condition 1: 15 % 3 == 0 , num_ans_str = "Fizz"
# Condition 2: 15 % 5 == 0 , num_ans_str += "Buzz"
# => num_ans_str = "FizzBuzz"
#

# Complexity Analysis
#
# Time Complexity: O(N)
# Space Complexity: O(1)

# @param {Integer} n
# @return {String[]}
