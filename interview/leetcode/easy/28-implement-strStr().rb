# ruby leetcode/easy/28-implement-strStr().rb

# Implement strStr().

# Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

# Example 1:
# Input: haystack = "hello", needle = "ll"
# Output: 2

# Example 2:
# Input: haystack = "aaaaa", needle = "bba"
# Output: -1

# Clarification:
# What should we return when needle is an empty string? This is a great question to ask during an interview.
# For the purpose of this problem, we will return 0 when needle is an empty string.

def str_str(haystack, needle)
  return 0 if needle == ''
  
  haystack.each_char.with_index do |char, index|        
    return index if haystack[index..index + needle.size - 1] == needle
  end
  
  -1
end

str_str('aaaaa','bba')