# Ruby program to fill an array with specific element

city = ["AGRA", "DELHI", "MUMBAI", "GWALIOR"];

print "Enter string: "
str = gets.chomp
city.fill(str)

print "Cities are: \n",city,"\n"

# abc_city = city.map{ |x| x = str }
# pp abc_city

# ruby arr_hsh/arr_fill.rb
# Enter string: abc
# Cities are: 
# ["abc", "abc", "abc", "abc"]