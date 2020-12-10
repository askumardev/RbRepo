require 'pry'
#-----------addition---------------
puts "enter a value :"
a=gets.chomp
puts "enter b value :"
b=gets.chomp
c=a.to_i+b.to_i
puts "Sum = #{c}"
#--------difference--------------

puts "Difference = #{a.to_i - b.to_i}"
#-----------multiplication-----------

puts "Product = #{a.to_i * b.to_i}"
#-------------division---------

puts "Division = #{a.to_i / b.to_i}"
puts "Division = #{a.to_f / b.to_i}"

