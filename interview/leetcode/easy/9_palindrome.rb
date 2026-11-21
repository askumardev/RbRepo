# 9. Palindrome Number

# Given an integer x, return true if x is a palindrome, and false otherwise.

# ruby leetcode/easy/9_palindrome.rb

def is_palindrome(x)
  return false unless x.is_a?(Integer)
  return false if x.negative?
  return true if x.between?(0, 9)
  return false if x % 10 == 0

  original = x
  reversed = 0

  while x > 0
    reversed = reversed * 10 + x % 10
    x /= 10
  end

  original == reversed
end

examples = [
  { input: 121, expected: true },
  { input: -121, expected: false },
  { input: 10, expected: false },
  { input: 0, expected: true },
  { input: 7, expected: true },
  { input: 12321, expected: true },
  { input: 12320, expected: false },
  { input: 1001, expected: true },
]

examples.each do |example|
  result = is_palindrome(example[:input])
  puts "Input: #{example[:input]} -> #{result} (expected: #{example[:expected]})"
end

# Example 1:
# Input: x = 121
# Output: true
# Example 2:
# Input: x = -121
# Output: false
