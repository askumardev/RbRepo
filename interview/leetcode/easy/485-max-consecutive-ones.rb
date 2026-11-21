# ruby leetcode/easy/485-max-consecutive-ones.rb

# Given a binary array, find the maximum number of consecutive 1s in this array.

# Example 1:
# Input: [1,1,0,1,1,1]
# Output: 3
# Explanation: The first two digits or the last three digits are consecutive 1s.
#     The maximum number of consecutive 1s is 3.
# Note:

# The input array will only contain 0 and 1.
# The length of input array is a positive integer and will not exceed 10,000

def find_max_consecutive_ones(nums)
  ones_count = 0
  max_count = 0
  
  nums.each do |num|
    if num == 0
      max_count = [max_count, ones_count].max
        
      ones_count = 0
    else
      ones_count += 1
    end
  end
  
  max_count = [max_count, ones_count].max
end