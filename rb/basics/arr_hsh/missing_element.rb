arr = [3,0,1,4,5]

n = arr.size

# expected_sum = (n * (n+1))/2
# actual_sum = arr.sum

# missing = expected_sum - actual_sum
# puts missing
puts "-----------------------------"
missing = (0..n).to_a - arr
puts missing.first


# ruby arr_hsh/missing_element.rb
