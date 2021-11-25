puts "***each with range"
(0..5).each do |i|
  puts "i = #{i}"
end

puts "***each with array"
[1,2,3,4,5].each do |i|
  puts "i = #{i}"
end
puts "*** each with single line"
[1,2,3,4,5].each {|i| puts "i = #{i}"}