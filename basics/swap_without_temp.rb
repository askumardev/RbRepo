# ruby basics/swap_without_temp.rb

a, b = 10, 20
puts("a = #{a} and b = #{b}")
a = a + b
b = a - b
a = a - b
puts("--------after swapping--------")
puts("a = #{a} and b = #{b}")