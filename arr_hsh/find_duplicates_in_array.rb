# ruby arr_hsh/find_duplicates_in_array.rb

# Find All Duplicates in an Array
#
# Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array),
# some elements appear twice and others appear once.
#
# Find all the elements that appear twice in this array.
#
# Could you do it without extra space and in O(n) runtime?
#
# Example:
# Input:
# [4,3,2,7,8,2,3,1]
#
# Output:
# [2,3]

def find_duplicates(array)
  counts = {} # here the default value is nil
  # counts = Hash.new(0) ## Here the default value is 0
  dup = []

  # Count occurrences of each element
  array.each do |element|
    counts[element] = 0 unless counts.key?(element) # this line is not needed if commeted `counts` is used
    counts[element] += 1
  end
  p counts

  # Collect elements that appear more than once
  counts.each do |element, count|
    dup << element if count > 1
  end
  dup
end

array = [4, 3, 2, 7, 8, 2, 3, 1]
p find_duplicates(array)
