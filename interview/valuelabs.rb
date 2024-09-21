

def flatten_hash(hash, parent_key = '', result = {})
  hash.each do |key, value|
    new_key = parent_key.empty? ? key : "#{parent_key}_#{key}"
    if value.is_a?(Hash)
      flatten_hash(value, new_key, result)
    else
      result[new_key.to_sym] = value
    end
  end
  result
end

hash = { a: { b: { c: 42, d: 'foo' }, d: 'bar' }, e: 'baz' }
flattened_hash = flatten_hash(hash)
puts flattened_hash

# {:a_b_c=>42, :a_b_d=>"foo", :a_d=>"bar", :e=>"baz"}

# ruby interview/valuelabs.rb
