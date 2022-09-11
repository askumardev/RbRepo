# ruby basics/iterators.rb

# Summary:
# Each -> returns same array
# Map & collect -> returns new array with code executed in block for each element
# Select -> return new array for the which give block is true
arr = [1, 2, 3, 4, 5]

puts "********each********"
#Each will evaluate the block with each array and will return the original array not the calculated one.
p arr.each { |n| n * 3 }
# If you are try to use each to select any specific values like where e <= 3 
# then it will evaluate each element but returns the original array
p arr.select{ |e| e <= 3 }

puts "********each_with_index********"
pets = ['dog','fish','cat','frog','pig']
pets.each_with_index do |val, idx|
  puts idx.to_s + ": " + val
end

puts "********select********"
#select returns a new array filtered by a condition in the block.
p arr.select{ |e| e * 3 }
# Select evaluates the block with each element for which the block returns true.
# and also, select would return a element for which the statement is true.
p arr.select{ |e| e <= 3 }

puts "********collect/map********"
# collect/Map takes the enumerable object and a block, evaluates the block for each element and 
# then return a new array with the calculated values.
#The original array is not modified. It returns the modified array.
#Collect is alias to map
p arr.map{ |e| e * 5 }
# If you are try to use map to select any specific values like where e <= 3 then it 
# will evaluate each element and will output only the result which will be either true or false
p arr.map{ |e| e <= 3 }