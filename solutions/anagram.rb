# ruby solutions/anagram.rb

def count_anagrams(parent, child)
  # Remove spaces and convert to lowercase for case-insensitive comparison
  clean_parent = parent.downcase.gsub(/\s+/, '')
  clean_child = child.downcase.gsub(/\s+/, '')

  # Initialize a counter for the number of occurrences
  count = 0

  # Iterate through substrings of the parent string
  clean_parent.chars.each_cons(clean_child.length) do |substring|
    # Check if the substring is an anagram of the child string
    count += 1 if substring.sort == clean_child.chars.sort
  end

  count
end

# Example usage:
parent_string = "An example string that contains an anagram of silent."
child_string = "listen"

occurrences = count_anagrams(parent_string, child_string)
puts "The child string or its anagrams appear #{occurrences} times in the parent string."

parent_string='AdnBndAndBdaBn'
child_string='dAn'
occurrences = count_anagrams(parent_string, child_string)
puts "The child string or its anagrams appear #{occurrences} times in the parent string."