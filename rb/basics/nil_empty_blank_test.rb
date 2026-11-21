# ruby basics/nil_empty_blank_test.rb

require 'active_support'
require 'active_support/core_ext/object/blank'

puts "---------- String test ----------"

p "".nil?       # false
p "".empty?     # true
p "".blank?     # true

p " ".nil?      # false
p " ".empty?    # false
p " ".blank?    # true

p "hello".blank? # false

puts "---------- Array test ----------"

p [].nil?       # false
p [].empty?     # true
p [].blank?     # true

p [1, 2].empty? # false
p [1, 2].blank? # false

puts "---------- Hash test ----------"

p {}.nil?       # false
p {}.empty?     # true
p {}.blank?     # true

p({ a: 1 }.empty?) # false

puts "---------- Nil test ----------"

p nil.nil?      # true
p nil.blank?    # true
p nil.empty?    # NoMethodError: undefined method `empty?' for nil:NilClass

puts "---------- Other test ----------"

p 0.blank?      # false
p false.blank?  # true
p true.blank?   # false
p "--------------Array test------------------------"
students = ["Jeery", "Tom", "Eddie"]
puts students[4] #nil  #this will output nothing since index doesnot exist
puts students[4].class #this will output the class that belongs to nil
puts students[0] == students[1] #false ->this will output false since both names does not match
puts (students[0] == students[1]).class #this will output the class that belongs to false

# p "-------------conditionals-------------------------"
# #special case
# #nil treated as false
# Jeery = nil
# if Jeery
#   puts "Jeery is present"
# else
#   puts "Jeery is absent"
# end
# # Jeery is absent


# #false treated as false
# Tom = false
# if Tom
#   puts "Tom is present"
# else
#   puts "Tom is absent"
# end
# # Tom is absent
