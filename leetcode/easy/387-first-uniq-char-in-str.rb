# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

# Examples:

# s = "leetcode"
# return 0.

# s = "loveleetcode",
# return 2.
# Note: You may assume the string contain only lowercase letters.

def first_uniq_char(s)
  s_hash = {}
  characters_in_order = []
  
  s.each_char.with_index do |char, index|
    if s_hash[char]
      s_hash[char][:occurences] += 1
      
      characters_in_order -= [char]
    else
      s_hash[char] = { occurences: 1, index: index }
      
      characters_in_order << char
    end
  end
  
  characters_in_order.empty? ? -1 : s_hash[characters_in_order.first][:index]
end