# ruby basics/nil_empty_blank_test.rb

require 'active_support'
require 'active_support/core_ext/object/blank'

# if we dont declare active support as require the blank method will return the errors
p "".nil?
p "".empty?
p "".blank? #undefined method `blank?' for an instance of String (NoMethodError)
p "--------------------------"

p [].nil?
p [].empty?
p [].blank? #undefined method `blank?' for an instance of String (NoMethodError)
p "--------------------------------------"
p nil.nil?
# p nil.empty? #undefined method `empty?' for nil (NoMethodError)
p nil.blank? #undefined method `blank?' for an instance of String (NoMethodError)
p "--------------------------------------"
students = ["Jeery", "Tom", "Eddie"]

puts students[4] #nil  #this will output nothing since index doesnot exist
puts students[4].class #this will output the class that belongs to nil
puts students[0] == students[1] #false ->this will output false since both names does not match
puts (students[0] == students[1]).class #this will output the class that belongs to false

p "--------------------------------------"
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
