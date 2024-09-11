# ruby ds/Searching/binary_search.rb

# Searches through a list for a value in O(log(n)) time.
# The list must be sorted.
def binary_search(array, target, low = 0, high = nil)
  high = array.length - 1 if high.nil?
  return -1 if low > high
  mid = (low + high) / 2
  if array[mid] == target
    return mid
  elsif array[mid] < target
    return binary_search(array, target, mid + 1, high)
  else
    return binary_search(array, target, low, mid - 1)
  end
end

# Example usage:
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
target = 7
index = binary_search(arr, target)

if index != -1
  puts "Element found at index #{index}"
else
  puts "Element not found"
end
