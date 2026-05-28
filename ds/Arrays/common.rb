def find_common(arr1, arr2)
  i = 0
  j = 0
  common = []

  while i < arr1.length && j < arr2.length
    if arr1[i] == arr2[j]
      common << arr1[i]
      i += 1
      j += 1
    elsif arr1[i] < arr2[j]
      i += 1
    else
      j += 1
    end
  end

  common
end

# Input arrays
arr1 = [1, 2, 4, 5, 6, 8]
arr2 = [2, 4, 6, 7, 8, 10]

# Find common integers
result = find_common(arr1, arr2)

puts "Common Integers: #{result}"

# ruby ds/Arrays/common.rb
