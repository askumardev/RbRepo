# ruby leetcode/easy/242-valid-anagrams.rb

# Given two strings s and t , write a function to determine if t is an anagram of s.

# Example 1:
# Input: s = "anagram", t = "nagaram"
# Output: true

# Example 2:
# Input: s = "rat", t = "car"
# Output: false
# Note:
# You may assume the string contains only lowercase alphabets.

def is_anagram(s, t)
  return false if s.size != t.size
  
  s_hash = Hash.new(0)
  t_hash = Hash.new(0)
  
  s = s.split('')
  t = t.split('')
  
  (0..(s.size - 1)).each do |i|
    s_hash[s[i]] += 1
    t_hash[t[i]] += 1
  end
  
  s_hash == t_hash
end
