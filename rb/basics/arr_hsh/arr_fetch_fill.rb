# ruby arr_hsh/arr_fetch_fill.rb

# Ruby program to fetch element from array based on index and fill elements

p "----arr fetch method-------"
city = ["AGRA", "DELHI", "MUMBAI", "GWALIOR"]

print "Enter index: "
index = gets.chomp.to_i
item = city.fetch(index)
print "City is: ",item,"\n"

p "----arr fill method-------"
print "Enter string: "
str = gets.chomp
city.fill(str)

print "Cities are: \n",city,"\n"

# abc_city = city.map{ |x| x = str }
# pp abc_city
