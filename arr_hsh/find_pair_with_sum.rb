# ruby arr_hsh/two_sum2.rb

# Given an array of integers numbers that is already sorted in ascending order, find two numbers such that
# they add up to a specific target number.

# Return the indices of the two numbers (1-indexed) as an integer array answer of size 2,
# where 1 <= answer[0] < answer[1] <= numbers.length.

# You may assume that each input would have exactly one solution and you may not use the same element twice.
# Approach 1: Two pointers

# Complexity analysis

# Time complexity: O(n). Each of the n elements is visited at
# most once, thus the time complexity is O(n).

# Space complexity: O(1). We only use two indexes, the space
# complexity is O(1).
puts "----------Hash Map Approach (Unsorted Array)----------"
def two_sum_hash_map(nums, target)
  seen = {}

  nums.each_with_index do |num, index|
    complement = target - num

    if seen.key?(complement)
      return [seen[complement] + 1, index + 1]
    end

    seen[num] = index
  end
end

# 🔸 Calling function
nums = [11, 2, 7, 15]
target = 9

result = two_sum_hash_map(nums, target)
puts "Hash Map Result: #{result.inspect}"

puts "---------------Two Pointer Approach (Sorted Array)---------------------------"

def two_sum_two_pointers(nums, target)
  left = 0
  right = nums.length - 1

  while left < right
    sum = nums[left] + nums[right]

    if sum < target
      left += 1
    elsif sum > target
      right -= 1
    else
      return [left + 1, right + 1]
    end
  end
end

# 🔸 Calling function
nums = [2, 7, 11, 15]  # MUST be sorted
target = 9

result = two_sum_two_pointers(nums, target)
puts "Two Pointer Result: #{result.inspect}"

# nums = [2, 7, 11, 15]
# target = 9
# print(two_sum(nums, target))
# # => [1,2]

# nums = [2, 3, 4]
# target = 6
# print(two_sum(nums, target))
# # => [1,3]

# nums = [-1, 0]
# target = -1
# print(two_sum(nums, target))
# # => [1,2]


puts "-----------Brute Force Approach--------------------"
def two_sum_brute_force(nums, target)
  (0...nums.length).each do |i|
    (i + 1...nums.length).each do |j|
      return [i + 1, j + 1] if nums[i] + nums[j] == target
    end
  end
end

# 🔸 Calling function
nums = [3, 2, 4]
target = 6

result = two_sum_brute_force(nums, target)
puts "Brute Force Result: #{result.inspect}"
