# nested_array = [1, [2, 3], [4, [5, 6]], 7]
# new_arr = nested_array.flatten
# p new_arr

def flatten_array(array, result = [])
  array.each do |element|
    if element.is_a?(Array)
      flatten_array(element, result)
    else
      result << element
    end
  end
  result
end

nested_array = [1, [2, 3], [4, [5, 6]], 7]
one_dimensional_array = flatten_array(nested_array)
puts one_dimensional_array.inspect

p"-----Using reduce-------------"
nested_array = [1, [2, 3], [4, [5, 6]], 7]
one_dimensional_array = nested_array.reduce([]) do |acc, element|
  acc.concat(element.is_a?(Array) ? element.flatten : [element])
end
puts one_dimensional_array.inspect

p"---------Using inject---------------"
def deep_flatten(array)
  array.inject([]) do |acc, element|
    acc + (element.is_a?(Array) ? deep_flatten(element) : [element])
  end
end

nested_array = [1, [2, 3], [4, [5, 6]], 7]
one_dimensional_array = deep_flatten(nested_array)
puts one_dimensional_array.inspect

# ruby arr_hsh/flatten_array.rb