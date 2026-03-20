# ruby interview/accolite.rb

arr = [1,2,3,4,5,6]
#output = [4,5,6,1,2,3]
index = 3

3.times { arr.push(arr.shift) }

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
