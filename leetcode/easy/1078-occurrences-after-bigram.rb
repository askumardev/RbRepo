# Given words first and second, consider occurrences in some text of the form "first second third", where second comes immediately after first, and third comes immediately after second.

# For each such occurrence, add "third" to the answer, and return the answer.

# Example 1:

# Input: text = "alice is a good girl she is a good student", first = "a", second = "good"
# Output: ["girl","student"]
# Example 2:

# Input: text = "we will we will rock you", first = "we", second = "will"
# Output: ["we","rock"]

def find_ocurrences(text, first, second)
  text = text.split(' ')
  
  word_output = []
  
  text.each_with_index do |word, index|
    next if index == 0 || index == 1
    
    word_output << word if text[index - 1] == second && text[index - 2] == first
  end
  
  word_output
end