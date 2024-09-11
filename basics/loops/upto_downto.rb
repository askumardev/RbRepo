1.upto(5) do |number|
  puts number
end

5.downto(1) do |number|
  puts number
end

puts "***upto "
5.upto(10) do |i|
  puts "i = #{i}"
end
puts "***upto alternate using blocks"
5.upto(10) { |i| puts i}

# ruby basics/loops/upto_downto.rb