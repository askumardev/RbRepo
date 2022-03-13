# The set S originally contains numbers from 1 to n. But unfortunately, due to the data error, one of the numbers in the set got duplicated to another number in the set, which results in repetition of one number and loss of another number.

# Given an array nums representing the data status of this set after the error. Your task is to firstly find the number occurs twice and then find the number that is missing. Return them in the form of an array.

# Example 1:
# Input: nums = [1,2,2,4]
# Output: [2,3]
# Note:
# The given array size will in the range [2, 10000].
# The given array's numbers won't have any order.

def find_error_nums(nums)
  nums_hash = Hash.new(0)
    
  duplicated_num = nil
  missing_num = nil
    
  nums.each_with_index do |num, index|
    nums_hash[num] += 1
      
    duplicated_num = num if nums_hash[num] == 2
  end
    
  (1..nums.size).each do |counter|
    missing_num = counter if nums_hash[counter] == 0
  end
    
  [duplicated_num, missing_num]
end
