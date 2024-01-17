# ruby solutions/missing_value.rb

arr = [2, 1, 5, 4, 6, 9, 7, 8, 10]
range = 1..10
range.each do |i|
  if arr.include?i
    p i
  else
    p "#{i} is missing from the given array"
  end
end

