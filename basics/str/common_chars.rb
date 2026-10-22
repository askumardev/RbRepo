str1 = "developer"
str2 = "envelope"

common_chars = str1.chars & str2.chars
p common_chars
# puts "Common characters: #{common_chars.join(', ')}"


# common_chars = str1.chars.intersection(str2.chars)
# p common_chars # => ["e", "v", "l", "o", "p"]

# common_chars = str1.chars.uniq.select { |char| str2.include?(char) }
# p common_chars

# ruby basics/str/common_chars.rb