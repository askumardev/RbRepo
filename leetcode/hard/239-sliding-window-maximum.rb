# ruby leetcode/hard/239-sliding-window-maximum.rb

# Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the 
# very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
# Return the max sliding window.

# Follow up:
# Could you solve it in linear time?

# Example:

# Input: nums = [1,3,-1,-3,5,3,6,7], and k = 3
# Output: [3,3,5,5,6,7] 
# Explanation: 

# Window position                Max
# ---------------               -----
# [1  3  -1] -3  5  3  6  7       3
#  1 [3  -1  -3] 5  3  6  7       3
#  1  3 [-1  -3  5] 3  6  7       5
#  1  3  -1 [-3  5  3] 6  7       5
#  1  3  -1  -3 [5  3  6] 7       6
#  1  3  -1  -3  5 [3  6  7]      7
 

# Constraints:

# 1 <= nums.length <= 10^5
# -10^4 <= nums[i] <= 10^4
# 1 <= k <= nums.length

def max_sliding_window(nums, k)
  max_array = []
  start_index = 0
  end_index = k - 1
  window = nums[start_index..end_index]
  
  (k..nums.size).each do |index|
    max_array << window.last(k).max
    window << nums[index]
  end
  
  max_array
end
