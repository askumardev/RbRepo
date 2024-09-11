# ruby leetcode/easy/258-add-digits.rb

# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

# Example:

# Input: 38
# Output: 2 
# Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. 
#              Since 2 has only one digit, return it.

def add_digits(num)
  num = num.to_s
  
  while num.length > 1
    new_num = num.split('').map(&:to_i).sum
    
    num = new_num.to_s
  end
  
  num.to_i
end