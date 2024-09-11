# ruby basics/gets_chomp.rb

# "gets" allows user input but a new line will be added after the string 
#(string means text or a sequence of characters)

#"gets.chomp" allows user input as well just like "gets", but there is not going to 
#be a new line that is added after the string.

require 'pry'
print('Enter your fname: ' )
fname = gets()
puts( "Hello #{fname}" )
print('Enter your lname: ' )
lname = gets
puts( "Hello #{lname}" )
#-----------addition---------------
print 'enter a value :'
a = gets.chomp
print 'enter b value :'
b = gets.chomp
c = a.to_i + b.to_i
puts "Sum = #{c}"
#--------difference--------------
puts "Difference = #{a.to_i - b.to_i}"
#-----------multiplication-----------
puts "Product = #{a.to_i * b.to_i}"

