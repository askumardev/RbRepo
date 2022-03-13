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
  x = x.to_s.reverse
  
  multiplier = x[x.size - 1] == '-' ? -1 : 1
  
  return 0 if x.to_i > 2 ** 31 - 1 || x.to_i < -1 * 2 ** 31
  
  x.to_i * multiplier
end

p reverse(123)
p reverse(-321)