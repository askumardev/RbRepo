# Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard.
 
# Example:

# Input: ["Hello", "Alaska", "Dad", "Peace"]
# Output: ["Alaska", "Dad"]
 
# Note:

# You may use one character in the keyboard more than once.
# You may assume the input string will only contain letters of alphabet.

def find_words(words)  
  result_words = []
  
  words.each do |word|
    row_chosen = choose_row(word)
    
    words_in_one_row = true
    
    word.each_char do |char|            
      words_in_one_row = false if !row_chosen.include?(char.downcase)
    end
    
    result_words << word if words_in_one_row
  end
  
  result_words
end

def choose_row(word)
  row_one = ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p']
  row_two = ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l']
  row_three = ['z', 'x', 'c', 'v', 'b', 'n', 'm']
  
  first_char = word[0].downcase
      
  if row_one.include?(first_char)
    row_chosen = row_one
  elsif row_two.include?(first_char)
    row_chosen = row_two
  else
    row_chosen = row_three
  end
  
  row_chosen
end
