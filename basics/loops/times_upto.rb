# ruby basics/loops/times_upto.rb

5.times do |i|
  puts "i = #{i}"
end


puts "***upto "
5.upto(10) do |i|
  puts "i = #{i}"
end
puts "***upto alternate using blocks"
5.upto(10) { |i| puts i}