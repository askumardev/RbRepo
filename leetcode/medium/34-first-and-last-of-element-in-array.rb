# Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

# Your algorithm's runtime complexity must be in the order of O(log n).

# If the target is not found in the array, return [-1, -1].

# Example 1:

# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]
# Example 2:

# Input: nums = [5,7,7,8,8,10], target = 6
# Output: [-1,-1]

def search_range(nums, target)
  positions_of_target = [-1, -1]  
    
  nums.each_with_index do |num, index|
    if num == target
      if positions_of_target[0] == -1
        positions_of_target[0] = index
        positions_of_target[1] = index
      else
        positions_of_target[1] = index
      end
    end
  end
    
   positions_of_target
end
