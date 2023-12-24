# ruby solutions/anagram.rb
require 'pry'

def count_anagrams(parent, child)
  # Remove spaces and convert to lowercase for case-insensitive comparison
  parent = parent.downcase.gsub(/\s+/, '')
  child = child.downcase.gsub(/\s+/, '')

  # Initialize a counter for the number of occurrences
  count = 0
  # Iterate through substrings of the parent string
  parent.chars.each_cons(child.length) do |substring|
    # Check if the substring is an anagram of the child string
    puts(substring.sort)
    count += 1 if substring.sort == child.chars.sort
  end

  count
end

# Example usage:
# parent_string = "An example string that contains an anagram of silent."
# child_string = "listen"

# occurrences = count_anagrams(parent_string, child_string)
# puts "The child string or its anagrams appear #{occurrences} times in the parent string."

parent = 'AdnBndAndBdaBn'
child = 'dAn'
occurrences = count_anagrams(parent, child)
puts "The child string or its anagrams appear #{occurrences} times in the parent string."