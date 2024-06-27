# ruby basics/nil_test.rb

p "".nil?
p "".empty?
p "".blank?

students = ["Jeery", "Tom", "Eddie"]

puts students[0] #this will print student at index 0

puts students[4] #nil  #this will output nothing since index doesnot exist

puts students[4].class #this will output the class that belongs to nil

puts students[0] == students[1] #false ->this will output false since both names does not match

puts (students[0] == students[1]).class #this will output the class that belongs to false


#special case
#nil treated as false
Jeery = nil
if Jeery
   puts "Jeery is present"
else 
   puts "Jeery is absent"
end

#false treated as false
Tom = false
if Tom
   puts "Tom is present"
else 
   puts "Tom is absent"
end
