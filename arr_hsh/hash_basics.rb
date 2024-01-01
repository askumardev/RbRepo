
# Using arrow (=>) syntax
my_hash = { "key1" => "value1", "key2" => "value2" }

# Using colon (:) syntax
my_hash = { :key1 => "value1", :key2 => "value2" }

# Using symbols as keys (a common practice in Ruby)
my_hash = { key1: "value1", key2: "value2" }

puts my_hash[:key1]  # Outputs "value1"
puts my_hash[:key2]  # Outputs "value2"

my_hash[:key3] = "value3"  # Add a new key-value pair
my_hash[:key1] = "new_value"  # Modify the value of an existing key

my_hash.each do |key, value|
  puts "#{key}: #{value}"
end

puts my_hash.keys    # Outputs an array of keys
puts my_hash.values  # Outputs an array of values

my_hash.delete(:key2)  # Deletes the key-value pair with key :key2

my_hash = Hash.new("default_value")
puts my_hash[:nonexistent_key]  # Outputs "default_value"
