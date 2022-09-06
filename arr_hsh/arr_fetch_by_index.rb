# Ruby program to fetch element from 
# array based on index

city = ["AGRA", "DELHI", "MUMBAI", "GWALIOR"];

print "Enter index: ";
index = gets.chomp.to_i;  

item = city.fetch(index);

print "City is: ",item,"\n";
