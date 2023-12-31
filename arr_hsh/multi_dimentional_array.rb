# ruby arr_hsh/multi_dimentional_array.rb

def custom_flatten(array)
  flattened_array = []
  
  array.each do |element|
    if element.is_a?(Array)
      flattened_array += custom_flatten(element)
    else
      flattened_array << element
    end
  end
  
  flattened_array
end

# Example usage:

# Creating a 2D array (matrix)
matrix_2d = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

# Using custom flatten function on the 2D array
flat_array = custom_flatten(matrix_2d)

# Output the flattened array
puts flat_array.inspect
# Output: [1, 2, 3, 4, 5, 6, 7, 8, 9]

matrix_3d = [
  [
    [10, 11, 12],
    [13, 14, 15]
  ],
  [
    [16, 17, 18],
    [19, 20, 21]
  ]
]

# Using custom flatten function on the 3D array
flat_array_3d = custom_flatten(matrix_3d)
puts flat_array_3d.inspect

startyear = [["a", "b", "z"], ["c", "d"], ["e", "f"], ["g", "h", "i", "j"]]
arr = startyear.flat_map(&:itself)
puts arr.inspect

arr1 = startyear.reduce(:+)
puts arr.inspect