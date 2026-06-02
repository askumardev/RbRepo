# ruby interview/synchrone.rb

def longest_substring_without_repetition(str)
  start = 0
  max_length = 0
  longest = ""
  hsh = {}

  str.chars.each_with_index do |char, current|
    puts "\nProcessing '#{char}' at index #{current}"
    p hsh[char]
    # Duplicate found inside current window
    if hsh.key?(char) && hsh[char] >= start
      puts "Duplicate '#{char}' found at index #{hsh[char]}"
      start = hsh[char] + 1
      puts "Moving start to #{start}"
    end

    # Store latest position
    hsh[char] = current

    current_length = current - start + 1

    puts "Current Window: #{str[start..current]}"
    puts "Current Length: #{current_length}"


    # current valid substring is longer than any substring we've seen so far.
    if current_length > max_length
      max_length = current_length
      longest = str[start..current]

      puts "New Longest Substring: #{longest}"
      puts "Max Length: #{max_length}"
    end

    puts "Hash: #{hsh}"
  end

  longest
end

puts "\nResult:"
puts longest_substring_without_repetition("abcaaadefdgdhijkl")

#puts longest_substringu("abcaaadefdgdhijkl")
