# ruby leetcode/easy/205-isomorphic-strings.rb

# Given two strings s and t, determine if they are isomorphic.

# Two strings are isomorphic if the characters in s can be replaced to get t.

# All occurrences of a character must be replaced with another character while preserving the order 
#of characters. No two characters may map to the same character but a character may map to itself.

# Example 1:
# Input: s = "egg", t = "add"
# Output: true

# Example 2:
# Input: s = "foo", t = "bar"
# Output: false

# Example 3:
# Input: s = "paper", t = "title"
# Output: true
# Note: # You may assume both s and t have the same length.

def is_isomorphic(s, t)  
  s_hash = {}
  t_hash = {}
  
  (0..s.size - 1).each do |index|
    if s_hash[s[index]]
      return false unless t[index] == s_hash[s[index]]
    else
      s_hash[s[index]] = t[index]
    end
    
    if t_hash[t[index]]
      return false unless s[index] == t_hash[t[index]]
    else
      t_hash[t[index]] = s[index]
    end
  end
  
  true
end