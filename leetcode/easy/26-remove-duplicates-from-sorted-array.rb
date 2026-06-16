# ruby leetcode/easy/26-remove-duplicates-from-sorted-array.rb

# Given a sorted array nums, remove the duplicates in-place such that each
# element appear only once and return the new
# length. Do not allocate extra space for another array, you must do this by
# modifying the input
#array in-place with O(1) extra memory.

# Example 1:
# Given nums = [1,1,2],
# Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
# It doesn't matter what you leave beyond the returned length.

# Example 2:
# Given nums = [0,0,1,1,1,2,2,3,3,4],
# Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4
# respectively. It doesn't matter what values are set beyond the returned length.

nums = [0,0,1,1,1,2,2,3,3,4]
write = 1

(1...nums.length).each do |read|
  if nums[read] != nums[read - 1]
    nums[write] = nums[read]
    write += 1
  end
end

p nums[0...write]
# [0,1,2,3,4]


# def remove_duplicates(nums)

#   nums.each_with_index do |num, index|
#     next if index == 0

#     if num == nums[index - 1]

#       nums[index - 1] = nil
#     end
#   end
#   p "------------------------"
#   p nums
#   nums.compact!

#   nums.count
# end

# nums = [0,0,1,1,1,2,2,3,3,4]
# p remove_duplicates(nums)
