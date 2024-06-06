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

# Each of these methods will remove duplicates from an array without using the uniq method. 
# The hash-based approach (Method 1) and the Set-based approach (Method 3) generally offer better performance for large arrays 
# compared to the include? method (Method 2), 
# which has a time complexity of O(n^2) due to repeated searches in the result array.