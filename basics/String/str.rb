# ruby str_stuff/str.rb

"ruby".size     # 4
"".size == 0    # true
"".empty?   # true
# interpolation
name = "Satish"
puts "Hello #{name}"

puts "The total is #{1+1}"  # "the total is 2"

string = "abc123"
string[0,3] # "abc"
string[3,3] # "123"
string[0..-2] # "abc12"

string = "Today is Saturday"
string.include?("Saturday") # true
string.index("day") # 2

binary_string = "1101"
binary_string.rjust(8, "0") # "00001101"

binary_string = "1111"
binary_string.ljust(8, "0") # "11110000"

lang1 = "ruby"
lang2 = "Ruby"
lang1.upcase == lang2.upcase  #true

extra_space = "   test    "
extra_space.strip # "test"

string = "ruby programming"
string.start_with? "ruby" # true
string.end_with? "programming"  # true

string = "a b c d"
string.split  # ["a", "b", "c", "d"]

csv = "a,b,c,d"
csv.split(",")  # ["a", "b", "c", "d"]

arr = ['a', 'b', 'c']
arr.join  # "abc"
arr.join("-") # "a-b-c"

string = "We have many dogs"
string.gsub("dogs", "cats") # "We have many cats"

string = "abccc"
string.gsub("c", "")  # "ab"

string = "We have 3 cats"
string.gsub(/\d+/, "5") # "We have 5 cats"

str = "aaab"
str.count("a")  # 3
str.count("b")  # 1