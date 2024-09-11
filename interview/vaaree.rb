# ruby interview/vaaree.rb

def whitelist(str)
  
  # Split the string into words
  words = str.split
  
  # Define a regular expression to match words with only alphabetic characters
  whitelist_regex = /^[A-Za-z,]+$/
  
  # Filter words using the regular expression
  valid_words = words.select { |word| word.match?(whitelist_regex) }
  
  # Output the valid words
  puts "Valid words: #{valid_words.join(' ')}"
  puts "Count of valid words: #{valid_words.length}"
end

str = "This is saturday13."
whitelist(str)

str = "Hello World!, N@mastey Satish. We are whitelisting !tems here..."
whitelist(str)