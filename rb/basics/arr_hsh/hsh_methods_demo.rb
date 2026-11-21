# ruby arr_hsh/hsh_methods_demo.rb

hash = {}
hash = { key1: 'value1', key2: 'value2' }
hash1 = { a: 100, b: 200 }
hash2 = { b: 254, c: 300 }

p hash[:key1]  # => 'value1'

hash[:key3] = 'value3'
hash.delete(:key2)  # => 'value2'

hash1.merge(hash2)  # => { a: 100, b: 254, c: 300 }
p hash1

hash.each do |key, value|
  puts "#{key}: #{value}"
end

p hash.keys   # => [:key1, :key3]
p hash.values # => ['value1', 'value3']

p hash.key?(:key1)     # => true
p hash.has_value?('value1')  # => true
