# ruby adv/add_numbers_str.rb

print "Enter a number string: "
str = gets.chomp
sum = str.scan(/\d+/).map(&:to_i).sum

puts "Sum of numbers in the string is : #{sum}"


# def sum_numbers_in_string(str)
#   str.scan(/\d+/).map(&:to_i).sum
# end

# puts sum_numbers_in_string("abc12def34")
# # => 46

# -------------------------------------
# Enter a number string: abc12def34
# Sum of numbers in the string is : 46
