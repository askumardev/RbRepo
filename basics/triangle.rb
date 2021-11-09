puts "Enter the height:"
count = gets.chomp.to_i
count.times do |n|
  print ' ' * (count - n)
  puts ' *'* (1 * n + 1)
end