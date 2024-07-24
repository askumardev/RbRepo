# ruby basics/String/str_rev.rb

#string reverse without any methods
s = "ruby programming"
b = s.length - 1
p b
while b >= 0
  print s[b]
  b = b - 1
end
puts"\n**************"


def reverse_string(string)
  split_string = string.split('')
  reversed = []
  string.size.times { reversed << split_string.pop }
  puts reversed.join
  # reversed.join
end
puts "***1***"
puts reverse_string('hello')

#Alternate method
str = "This is a full sentence"
puts "***2***"
p str.reverse

#Alternate method
rev = ''
for i in 1..str.length
  #puts str[i]
  rev += str[str.length - i]
end
puts "***3***"
puts rev

#Alternate method to reverse word
str = str.split(" ").reverse!.join(" ")
puts "***4***"
puts str

#Alternate method
puts "***5***"
puts str.chars.inject{|x,y| y + x}

#
original_string = "Hello, World!"
length = original_string.length
reversed_string = ""

(length - 1).downto(0) do |i|
  reversed_string += original_string[i]
end

puts reversed_string

puts "****two pointer technique**"
def reverse_string(str)
  chars = str.chars
  left = 0
  right = chars.length - 1
  while left < right
    chars[left], chars[right] = chars[right], chars[left]
    left += 1
    right -= 1
  end
  chars.join
end

str = "hello"
puts reverse_string(str)  # Output: "olleh"


