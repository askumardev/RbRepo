print "Enter a number string: "
str = gets.chomp
sum = str.scan(/\d+/).map(&:to_i).sum

puts "Sum of numbers in the string is : #{sum}"


# ruby adv/add_numbers_str.rb

# Enter a number string: abc12def34
# Sum of numbers in the string is : 46
