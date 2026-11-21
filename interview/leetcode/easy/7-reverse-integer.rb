# ruby leetcode/easy/7-reverse-integer.rb

# Given a 32-bit signed integer, reverse digits of an integer.

# Example 1:
# Input: 123
# Output: 321

# Example 2:
# Input: -123
# Output: -321

# Example 3:
# Input: 120
# Output: 21

# Note:
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1].
# For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

def reverse(x)
  sign = x < 0 ? -1 : 1
  reversed = x.abs.to_s.reverse.to_i
  reversed *= sign
  return 0 if reversed < -(2**31) || reversed > (2**31 - 1)

  reversed
end

p reverse(123)          # 321
p reverse(-321)         # -123
p reverse(120)          # 21
p reverse(1534236469)   # 0 (overflow)
