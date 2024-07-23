arr = [1,2,2,3,3,3,4,5,5]
p "---------remove_duplicates_using_array----------------"
def remove_duplicates_using_array(arr)
  new1 = []
  arr.each do |i|
    new1 << i unless new1.include?(i)
  end
  new1
end
p remove_duplicates_using_array(arr)

p "---------remove_duplicates_using_hash----------------"
def remove_duplicates_using_hash(arr)
  new1 = {}
  arr.each do |i|
    new1[i] = i
  end
  new1.values
end
p remove_duplicates_using_hash(arr)

# ruby arr_hsh/arr_uniq_array_hash.rb

# Each of these methods will remove duplicates from an array without using the uniq method.
# The hash-based approach (Method 1) and the Set-based approach (Method 3) generally offer better performance for large arrays
# compared to the include? method (Method 2),
# which has a time complexity of O(n^2) due to repeated searches in the result array.
