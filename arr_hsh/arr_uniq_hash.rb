def remove_duplicates(array)
  seen = {}
  result = []
  
  array.each do |element|
    unless seen[element]
      result << element
      seen[element] = true
    end
  end
  
  result
end

# Example usage
arr = [1, 2, 2, 3, 4, 4, 5]
puts remove_duplicates(arr).inspect
# Output: [1, 2, 3, 4, 5]

# ruby interview/arr_uniq_hash.rb