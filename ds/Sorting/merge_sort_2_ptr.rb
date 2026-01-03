def merge_sorted_arrays(arr1, arr2)
  i = 0
  j = 0
  result = []

  # Traverse both arrays
  while i < arr1.length && j < arr2.length
    if arr1[i] <= arr2[j]
      result << arr1[i]
      i += 1
    else
      result << arr2[j]
      j += 1
    end
  end

  # Append remaining elements
  while i < arr1.length
    result << arr1[i]
    i += 1
  end

  while j < arr2.length
    result << arr2[j]
    j += 1
  end

  result
end


arr1 = [1, 3, 5, 7]
arr2 = [2, 4, 6, 8]

merged = merge_sorted_arrays(arr1, arr2)
puts merged.inspect
