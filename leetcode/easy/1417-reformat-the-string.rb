# Given alphanumeric string s. (Alphanumeric string is a string consisting of lowercase English letters and digits).

# You have to find a permutation of the string where no letter is followed by another letter and no digit is followed by another digit. That is, no two adjacent characters have the same type.

# Return the reformatted string or return an empty string if it is impossible to reformat the string.

# Example 1:

# Input: s = "a0b1c2"
# Output: "0a1b2c"
# Explanation: No two adjacent characters have the same type in "0a1b2c". "a0b1c2", "0a1b2c", "0c2a1b" are also valid permutations.
# Example 2:

# Input: s = "leetcode"
# Output: ""
# Explanation: "leetcode" has only characters so we cannot separate them by digits.
# Example 3:

# Input: s = "1229857369"
# Output: ""
# Explanation: "1229857369" has only digits so we cannot separate them by characters.
# Example 4:

# Input: s = "covid2019"
# Output: "c2o0v1i9d"
# Example 5:

# Input: s = "ab123"
# Output: "1a2b3"

# Constraints:

# 1 <= s.length <= 500
# s consists of only lowercase English letters and/or digits.

def reformat(s)
  return s if s.size == 1
  
  num_arrays = ('0'..'9').to_a
  alphabetical_array = ('a'..'z').to_a
  
  numbers_array = []
  alpha_array = []
  
  char_hash = Hash.new(0)
  
  s.each_char do |char|
    numbers_array << char if num_arrays.include?(char)
    alpha_array << char if alphabetical_array.include?(char)
  end
  
  str = ''
  
  while !numbers_array.empty? && !alpha_array.empty?
    str << numbers_array.pop
    str << alpha_array.pop
  end
  
  if alpha_array.size > 0
    if num_arrays.include?(str[str.size - 1])
      str << alpha_array.pop
    elsif num_arrays.include?(str[0])
      str.prepend(alpha_array.pop)
    end
  elsif numbers_array.size > 0
    if alphabetical_array.include?(str[str.size - 1])
      str << numbers_array.pop
    elsif alphabetical_array.include?(str[0])
      str.prepend(numbers_array.pop)
    end
  end
  
  str
end
