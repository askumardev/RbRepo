# ruby leetcode/easy/520-detect-capital.rb

# Given a word, you need to judge whether the usage of capitals in it is right or not.

# We define the usage of capitals in a word to be right when one of the following cases holds:

# All letters in this word are capitals, like "USA".
# All letters in this word are not capitals, like "leetcode".
# Only the first letter in this word is capital, like "Google".
# Otherwise, we define that this word doesn't use capitals in a right way.
 
# Example 1:
# Input: "USA"
# Output: True
 
# Example 2:
# Input: "FlaG"
# Output: False
 
# Note: The input will be a non-empty word consisting of uppercase and lowercase latin letters.

def detect_capital_use(word)
  char_lower = nil
  
  word.each_char.with_index do |char, index|
    if index == 0 || (index == 1 && char_lower == false)
      char_lower = is_lower(char)
      
      next
    end
    
    return false if char_lower != is_lower(char) 
  end
  
  true
end

def is_lower(char)
  char >= 'a' && char <= 'z'
end