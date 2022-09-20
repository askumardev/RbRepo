# ruby str_stuff/str_rev.rb

#string reverse without any methods
s = "ruby programming"
b = s.length - 1
p b
while b >= 0
  print s[b]
  b=b-1
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


