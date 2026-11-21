hsh = {key1: "value1", key2: "value2", key3: "value3"}

hsh.each do |key, value|
  puts "#{key}: #{value}"
end

hsh.each_key do |key|
  puts key
end

hsh.each_value do |value|
  puts value
end

hsh.each_with_index do |(key,value), index|
  puts "index: #{index} | key: #{key} | value: #{value}"
end