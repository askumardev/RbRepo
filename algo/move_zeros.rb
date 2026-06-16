# Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

# Note that you must do this in-place without making a copy of the array.

# Example 1:
# Input
# nums = [0,1,0,3,12]

# ruby algo/move_zeros.rb

def move_zeros(arr)
  insert_pos = 0

  arr.each_index do |i|
    if arr[i] != 0
      arr[insert_pos], arr[i] = arr[i], arr[insert_pos]
      insert_pos += 1
    end
  end

  arr
end

arr = [0, 12, 0, 3, 4]
p move_zeros(arr)
# => [12, 3, 4, 0, 0]

# -----------------------------
nums = [0, 12, 0, 3, 4]

non_zeros = []
zeros = []
nums.each do |x|
  if x != 0
    non_zeros << x
  else
    zeros << x
  end
end

p non_zeros.sort + zeros

# non_zeros, zeros = nums.partition(&:nonzero?)
# p non_zeros.sort + zeros

# def move_zeroes(nums)
#   insert_pos = 0

#   # Move all non-zero elements to the front
#   nums.each do |num|
#     if num != 0
#       nums[insert_pos] = num
#       insert_pos += 1
#     end
#   end

#   # Fill remaining positions with 0
#   while insert_pos < nums.length
#     nums[insert_pos] = 0
#     insert_pos += 1
#   end

#   nums
# end

# # Example
# nums = [0, 1, 0, 3, 12]
# puts move_zeroes(nums).inspect
