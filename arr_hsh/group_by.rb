numbers = [1, 2, 3, 4, 5, 6]

grouped = numbers.group_by { |n| n.even? }

puts grouped

# ruby arr_hsh/group_by.rb
