# ruby leetcode/medium/1006-clumsy-factorial.rb

# Normally, the factorial of a positive integer n is the product of all positive integers less than or equal to n.
# For example, factorial(10) = 10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1.

# We instead make a clumsy factorial: using the integers in decreasing order, we swap out the multiply operations for a 
# fixed rotation of operations: multiply (*), divide (/), add (+) and subtract (-) in this order.

# For example, clumsy(10) = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1.  However, these operations are still applied using 
# the usual order of operations of arithmetic: we do all multiplication and division steps before any 
# addition or subtraction steps, and multiplication and division steps are processed left to right.

# Additionally, the division that we use is floor division such that 10 * 9 / 8 equals 11.  This guarantees the result is an integer.

# Implement the clumsy function as defined above: given an integer N, it returns the clumsy factorial of N.

# Example 1:
# Input: 4
# Output: 7
# Explanation: 7 = 4 * 3 / 2 + 1

# Example 2:
# Input: 10
# Output: 12
# Explanation: 12 = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1

# Note:
# 1 <= N <= 10000
# -2^31 <= answer <= 2^31 - 1  (The answer is guaranteed to fit within a 32-bit integer.)

def clumsy(n)
  a = (1..n).to_a.reverse
  
  result = [a[0]]
  
  a[1..a.size - 1].each_with_index do |num, index|
    if index % 4 == 0
      result << '*'
    elsif index % 4 == 1            
      result << '/'
    elsif index % 4 == 2
      result << '+'
    else
      result << '-'
    end
    
    result << num
  end
  
  result = multiply_and_divide_all_results(result)
  
  add_and_subtract_all_results(result)
end

def multiply_and_divide_all_results(result)
  index = result.index('*')
  
  while index
    num_to_insert = result[index - 1] * result[index + 1]
    
    if index + 3 <= result.size - 1
      num_to_insert /= result[index + 3]
    end
    
    result[index - 1..index + 3] = num_to_insert
    
    index = result.index('*')
  end
  
  result
end

def add_and_subtract_all_results(result)
  total = result[0].to_i
  
  result.each_with_index do |operation, index|        
    if operation == '+'
      total += result[index + 1].to_i
    elsif operation == '-'
      total -= result[index + 1].to_i
    end
  end
  
  total
end