Iterators in Ruby are a convenient way to loop through collections or data structures, such as arrays, hashes, ranges, and more. They allow you to perform a certain operation for each element in the collection without having to write a repetitive loop.

Here are some commonly used iterators in Ruby:

each: The each method iterates over each element in a collection and applies a block of code to each element.
ruby
Copy code
[1, 2, 3].each do |number|
  puts number
end
map: The map method iterates over each element in a collection and returns a new array with the results of running the block of code on each element.
ruby
Copy code
[1, 2, 3].map do |number|
  number * 2
end
select: The select method iterates over each element in a collection and returns a new array with only the elements that meet a certain condition specified in the block of code.
ruby
Copy code
[1, 2, 3].select do |number|
  number > 1
end
times: The times method executes a block of code a specified number of times.
ruby
Copy code
3.times do
  puts "hello"
end
upto and downto: The upto and downto methods allow you to iterate over a range of numbers, either increasing or decreasing.
ruby
Copy code
1.upto(5) do |number|
  puts number
end

5.downto(1) do |number|
  puts number
end
These are just a few of the many iterators available in Ruby. Iterators can make your code more concise, readable, and expressive by abstracting away the details of the loop and allowing you to focus on what you want to do with each element of the collection.