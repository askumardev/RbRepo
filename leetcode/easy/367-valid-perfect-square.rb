# Given a positive integer num, write a function which returns True if num is a perfect square else False.

# Follow up: Do not use any built-in library function such as sqrt.

# Example 1:

# Input: num = 16
# Output: true
# Example 2:

# Input: num = 14
# Output: false 

# Constraints:

# 1 <= num <= 2^31 - 1

def is_perfect_square(num)
  i = 1
  
  loop do
    square_num = i ** 2
    
    if square_num == num
        return true
    elsif square_num > num
        return false
    end
    
    i += 1
  end
end