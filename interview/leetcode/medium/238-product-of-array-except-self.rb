# ruby leetcode/medium/238-product-of-array-except-self.rb

# Given an array nums of n integers where n > 1,  return an array output such 
# that output[i] is equal to the product of all the elements of nums except nums[i].

# Example:

# Input:  [1,2,3,4]
# Output: [24,12,8,6]
# Constraint: It's guaranteed that the product of the elements of any prefix or 
# suffix of the array (including the whole array) fits in a 32 bit integer.

def product_except_self(nums)
  product = 1
  num_zeros = 0
  
  nums.each do |num|
    num_zeros += 1 if num == 0
    
    next if num == 0
    
    product *= num
  end
  
  nums.each_with_index do |num, index|
    if num_zeros > 1
      nums[index] = 0
    elsif num_zeros == 1 && num != 0
      nums[index] = 0
    elsif num_zeros == 1 && num == 0
      nums[index] = product
    else
      nums[index] = product / num 
    end
  end
  
  nums
end