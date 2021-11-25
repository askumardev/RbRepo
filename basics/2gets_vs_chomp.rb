# gets 
# gets.chomp

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
#-------------division---------

puts "Division = #{a.to_i / b.to_i}"
puts "Modulo Division = #{a.to_f / b.to_i}"
