require 'pry'
numbers = [ 13, 153, 6, 192, 28 ]
puts "Array: #{numbers}"


first = -(2**(0.size * 8 -2))
second = -(2**(0.size * 8 -2))

for number in numbers 
	binding.pry
	if number > first
		binding.pry
		second = first
		first = number
		binding.pry
	end
end
binding.pry
puts "First highest: #{first}"
puts "Second highest: #{second}"
