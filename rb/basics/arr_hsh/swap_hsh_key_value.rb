# ruby arr_hsh/swap_hsh_key_value.rb

original_hash = { a: 1, b: 2, c: 3 }

# Initialize an empty hash for the swapped key-value pairs
swapped_hash = {}

# Iterate over each key-value pair in the original hash
original_hash.each do |key, value|
  # Assign the value as the key and the key as the value in the new hash
  swapped_hash[value] = key
end

puts swapped_hash
