def remove_duplicates(array)
  result = []

  array.each do |element|
    result << element unless result.include?(element)
  end
  result
end

# Example usage
arr = [1, 2, 2, 3, 4, 4, 5]
puts remove_duplicates(arr).inspect
# Output: [1, 2, 3, 4, 5]

# ruby interview/arr_uniq_array.rb