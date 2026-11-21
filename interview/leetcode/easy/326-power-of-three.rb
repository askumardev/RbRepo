# ruby leetcode/easy/326-power-of-three.rb

# Given an integer, write a function to determine if it is a power of three.

# Example 1:
# Input: 27
# Output: true

# Example 2:
# Input: 0
# Output: false

# Example 3:
# Input: 9
# Output: true

# Example 4:
# Input: 45
# Output: false

def is_power_of_three(n)
  return false if n == 0
  
  while n != 1
    if n % 3 == 0
      n = n / 3
    else
      return false
    end
  end
  
  true
end