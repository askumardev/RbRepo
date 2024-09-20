# ruby interview/nous.rb

str = "aabbbccddda"
arr = str.chars
result = ""
count = 1
arr.each_with_index do |x,i|
  if arr[i] == arr[i+1]
    count += 1
  else
    result += "#{count}#{x}"
    count = 1
  end
end
p result
