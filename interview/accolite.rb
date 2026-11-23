# ruby interview/accolite.rb

arr = [1,2,3,4,5,6]
#output = [4,5,6,1,2,3]
index = 3

index.times { arr.push(arr.shift) }
# arr.shift removes and returns the first element.
# arr.push(...) appends that element to the end.
# 1st ->arr.shift-> [2,3,4,5,6] -> arr.push-> [2,3,4,5,6,1]
# 2nd ->arr.shift-> [3,4,5,6,1] -> arr.push-> [3,4,5,6,1,2]
# 3rd ->arr.shift-> [4,5,6,1,2] -> arr.push-> [4,5,6,1,2,3]
p arr

#---------------alternate ------------------
r1, r2 = arr.each_slice(index).to_a
p r1
p r2
arr = r2 + r1

#---------------alternate ------------------
arr = arr.rotate(index)

#---------------alternate ------------------
result = arr.values_at(3,4,5,0,1,2)

#---------------alternate ------------------
result = arr.cycle.drop(3).take(arr.size)

#---------------alternate ------------------
left, right = arr.partition.with_index { |_, i| i >= 3 }
result = left + right
p result

#---------------alternate ------------------
result = arr.slice!(0,3)
arr.concat(result)

#---------------alternate ------------------

# new = []
# index.times do |x|
#   new << arr.shift
# end
# p arr  #[4, 5, 6]
# p new  #[1, 2, 3]
# new = arr + new
# p new
