# Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

# Each letter in the magazine string can only be used once in your ransom note.

# Example 1:

# Input: ransomNote = "a", magazine = "b"
# Output: false
# Example 2:

# Input: ransomNote = "aa", magazine = "ab"
# Output: false
# Example 3:

# Input: ransomNote = "aa", magazine = "aab"
# Output: true

# Constraints:

# You may assume that both strings contain only lowercase letters.

def can_construct(ransom_note, magazine)
  magazine_chars_hash = Hash.new(0)
  
  magazine.each_char do |char|
    magazine_chars_hash[char] += 1
  end
  
  ransom_note.each_char do |char|
    return false if magazine_chars_hash[char].zero?
      
    magazine_chars_hash[char] -= 1
  end
  
  true
end