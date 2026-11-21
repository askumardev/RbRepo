# reverse array without using reverse method

# ruby arr_hsh/arr_rev.rb

array = [1, 2, 3]

p "---------using pop-----------------"
def reverse(array)
  rev = []
  rev << array.pop until array.empty?
  rev
end
p reverse(array)

p "---------using unshift-----------------"
reversed = []
array.each do |x|
  reversed.unshift x
end
p reversed

# p "---------using insert-----------------"
# def reverse_arr(array)
#   p array
#   array.length.times do |i|
#     array.insert(i, array.pop)
#   end
#   array  # Ensure the method returns the modified array
# end
# p reverse_arr(array)
# a = [1,2,3]
# b = []
# i = a.length
# while i > 0
#   b << a[i-1]
#   i = i - 1
# end
# p b
