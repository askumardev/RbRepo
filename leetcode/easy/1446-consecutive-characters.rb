# ruby leetcode/easy/1446-consecutive-characters.rb

# Given a string s, the power of the string is the maximum length of a non-empty substring that contains only one 
# unique character.

# Return the power of the string.

# Example 1:
# Input: s = "leetcode"
# Output: 2
# Explanation: The substring "ee" is of length 2 with the character 'e' only.

# Example 2:
# Input: s = "abbcccddddeeeeedcba"
# Output: 5
# Explanation: The substring "eeeee" is of length 5 with the character 'e' only.

# Example 3:
# Input: s = "triplepillooooow"
# Output: 5

# Example 4:
# Input: s = "hooraaaaaaaaaaay"
# Output: 11

# Example 5:
# Input: s = "tourist"
# Output: 1
 

# Constraints:
# 1 <= s.length <= 500
# s contains only lowercase English letters.

def max_power(s)
  return 0 if s == ''
  
  max_power_of_string = 1
  current_power_of_string = 1
  
  (1..s.size - 1).each do |index| 
    if s[index] == s[index - 1]
      current_power_of_string += 1 
        
      next
    end
    
    max_power_of_string = [max_power_of_string, current_power_of_string].max
    
    current_power_of_string = 1
  end
  
  [max_power_of_string, current_power_of_string].max
end