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

def longest_common_prefix(strs)
  return '' if strs == []  
  prefix = strs[0]  
  strs[1..strs.size - 1].each do |string|
    if string.size < prefix.size
      prefix = prefix[0..string.size]
    end
    
    (0..prefix.size).each do |i|
      next if string[i] == prefix[i]
      
      return '' if i == 0
      
      prefix = prefix[0..i - 1]

      break
    end
  end  
  prefix
end