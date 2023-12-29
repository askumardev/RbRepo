# ruby basics/loops/enumeration.rb

# In Ruby, enumeration typically refers to the process of iterating over a collection of items, 
# such as an array or a hash. Ruby provides several ways to perform enumeration, and here are 
# some of the common methods and concepts associated with enumeration:

# each Method:
# The each method is used to iterate over elements in a collection. 
# It can be applied to arrays, hashes, ranges, and other enumerable objects.
puts("-------------each Method----------------")
numbers = [1, 2, 3, 4, 5]
numbers.each do |num|
  pp num
end


# map Method:
# The map method is used to transform each element of an array and return a new array 
# containing the results.
puts("-------------map Method----------------")
numbers = [1, 2, 3, 4, 5]
squared_numbers = numbers.map { |num| num**2 }
pp squared_numbers

# select and reject Methods:
# The select method is used to filter elements based on a given condition, 
# while reject is used to exclude elements that meet a certain condition.
puts("-------------select/reject Method----------------")
numbers = [1, 2, 3, 4, 5]
even_numbers = numbers.select { |num| num.even? }
odd_numbers = numbers.reject { |num| num.even? }

# each_with_index Method:
# The each_with_index method allows you to iterate over both the elements and their corresponding indices.

fruits = ['apple', 'banana', 'orange']
fruits.each_with_index do |fruit, index|
  puts "#{index + 1}. #{fruit}"
end

# Enumerable Module:
# The Enumerable module provides additional methods for enumeration. 
# Classes that include this module gain access to methods like count, max, min, sort, and more.
puts("-------------Enumerable Module----------------")
numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
total = numbers.reduce(:+)
puts(total)
maximum = numbers.max
puts(maximum)
sorted_numbers = numbers.sort
pp(sorted_numbers)

# Custom Enumeration with Enumerator:
# You can create custom enumerators using the Enumerator class. 
# This allows you to define your own iteration logic.
puts("-------------Enumeration with Enumerator----------------")
enumerator = Enumerator.new do |yielder|
  yielder << 1
  yielder << 2
  yielder << 3
end
enumerator.each { |num| puts num }

# These are just some of the fundamental methods and concepts related to enumeration in Ruby. 
# The Enumerable module provides many more methods that can be quite powerful 
# when working with collections in Ruby.