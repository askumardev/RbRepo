# ruby leetcode/easy/290-word-pattern.rb

# Given a pattern and a string str, find if str follows the same pattern.

# Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.

# Example 1:
# Input: pattern = "abba", str = "dog cat cat dog"
# Output: true

# Example 2:
# Input:pattern = "abba", str = "dog cat cat fish"
# Output: false

# Example 3:
# Input: pattern = "aaaa", str = "dog cat cat dog"
# Output: false

# Example 4:
# Input: pattern = "abba", str = "dog dog dog dog"
# Output: false
# Notes:
# You may assume pattern contains only lowercase letters, and str contains lowercase letters that may be separated by a 
# single space.

def word_pattern(pattern, str)
  str_hash = {}
  pattern_hash = {}
  
  return false if pattern.chars.size != str.split(' ').size
  
  str.split(' ').each_with_index do |substr, index|
    if str_hash[pattern[index]]
      return false unless str_hash[pattern[index]] == substr
    else
      str_hash[pattern[index]] = substr
    end
    
    if pattern_hash[substr]
      return false unless pattern_hash[substr] == pattern[index]
    else
      pattern_hash[substr] = pattern[index]
    end
    
    puts str_hash
    puts pattern_hash
  end
  
  true
end