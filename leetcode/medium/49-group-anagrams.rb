# ruby leetcode/medium/49-group-anagrams.rb

# Given an array of strings, group anagrams together.

# Example:

# Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
# Output:
# [
#   ["ate","eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]
# Note:

# All inputs will be in lowercase.
# The order of your output does not matter.

def group_anagrams(strs)
  strhash = Hash.new {|h,k| h[k] = [] } 
    
  strs.each_with_index do |str|
    key = str.split('').sort.join
    
    strhash[key] << str
  end
    
  strhash.values
end