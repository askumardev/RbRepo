# ruby arr_hsh/str_rev.rb

str = "BLUE SKY"
puts "------Simplest way by using split, reverse and join methods-----"
str_rev = str.split.reverse.join(' ')
p str_rev

puts "------Alternate way-------"
words = str.split
p words
words[0], words[1] = words[1], words[0]
p words.join(' ')

puts "------Alternate way without using reverse-------"
str = "This is Ruby Programming"
words = str.split
p words
reversed_string = ""

(words.length - 1).downto(0) do |i|
  reversed_string += words[i] + " "
end
p reversed_string
reversed_string.rstrip!  # Remove the trailing space

puts reversed_string


