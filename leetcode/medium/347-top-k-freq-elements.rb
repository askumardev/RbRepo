# Given a non-empty array of integers, return the k most frequent elements.

# Example 1:

# Input: nums = [1,1,1,2,2,3], k = 2
# Output: [1,2]
# Example 2:

# Input: nums = [1], k = 1
# Output: [1]
# Note:

# You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
# Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
# It's guaranteed that the answer is unique, in other words the set of the top k frequent elements is unique.
# You can return the answer in any order.

def top_k_frequent(nums, k)
  nums_hash = Hash.new(0)
  
  nums.each do |num|
    nums_hash[num] += 1
  end
  
  ordered_hash = nums_hash.sort_by { |k, v| v }
  
  ordered_hash.last(k).map(&:first)
end