# Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.

# This is case sensitive, for example "Aa" is not considered a palindrome here.

# Note:
# Assume the length of given string will not exceed 1,010.

# Example:

# Input:
# "abccccdd"

# Output:
# 7

# Explanation:
# One longest palindrome that can be built is "dccaccd", whose length is 7.

def longest_palindrome(s)
  string_hash = Hash.new(0)
  
  s.each_char do |char|
    string_hash[char] += 1
  end
  
  beginning_count = 0
  middle_count = 0
  
  string_hash.keys.each do |key|
    if string_hash[key] % 2 == 1
      middle_count = 1
    end
    
    beginning_count += string_hash[key] / 2
  end
  
  beginning_count * 2 + middle_count
end
