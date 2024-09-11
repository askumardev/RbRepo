# ruby leetcode/easy/1408-string-matching-in-an-array.rb

# Given an array of string words. Return all strings in words which is substring of another word in any order. 

# String words[i] is substring of words[j], if can be obtained removing some characters to left and/or right side 
# of words[j].

# Example 1:
# Input: words = ["mass","as","hero","superhero"]
# Output: ["as","hero"]
# Explanation: "as" is substring of "mass" and "hero" is substring of "superhero".
# ["hero","as"] is also a valid answer.

# Example 2:
# Input: words = ["leetcode","et","code"]
# Output: ["et","code"]
# Explanation: "et", "code" are substring of "leetcode".

# Example 3:
# Input: words = ["blue","green","bu"]
# Output: []
 
# Constraints:
# 1 <= words.length <= 100
# 1 <= words[i].length <= 30
# words[i] contains only lowercase English letters.
# It's guaranteed that words[i] will be unique.

def string_matching(words)
  result_words = []

  words.each_with_index do |possible_substring, index|
    (0..words.size - 1).each do |index_w|
      next if index_w == index || words[index_w].size < possible_substring.size
      
      result_words << possible_substring if words[index_w].index(possible_substring)
    end
  end
  
  result_words.uniq
end