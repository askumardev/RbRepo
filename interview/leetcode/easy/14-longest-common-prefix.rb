# ruby leetcode/easy/14-longest-common-prefix.rb

# Write a function to find the longest common prefix string amongst an array of strings.
# If there is no common prefix, return an empty string "".

# Example 1:
# Input: ["flower","flow","flight"]
# Output: "fl"

# Example 2:
# Input: ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

# Note:
# All given inputs are in lowercase letters a-z.
require 'pry'
def longest_common_prefix(arr)
  return '' if arr == []
  prefix = arr.first
  arr[1..].each do |str|
    while !str.start_with?(prefix)
      prefix = prefix[0...-1]
      #p prefix
      return '' if prefix.empty?
    end
  end

  prefix
end

strs = ["flow","flower","flight"]
p longest_common_prefix(strs)

# strs = ["dog","racecar","car"]
# p longest_common_prefix(strs)
