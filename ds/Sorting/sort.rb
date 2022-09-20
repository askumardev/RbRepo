# ruby ds/Sorting/sort.rb

a = [1, 5, 7, 2, 3, 50, 78, 34, 89]

def sort(a)
  a.size.times.each do |_t|
    i = 0
    a.each do |b|
      a[i], a[i + 1] = a[i + 1], a[i] if b > a[i + 1]
      i += 1 if i < a.size - 2
    end
  end
  print a
end
sort(a)

# a.size.times.each do |t|
#   i=0
#   a.each do |b|
#     if b > a[i+1]
#       a[i],a[i+1] = a[i+1],a[i]
#     end
#     i+=1 if i < a.size-2
#   end
# end
# print a

# def bubble_sort(array)
#     n = array.length
#     loop do
#       swapped = false

#       (n-1).times do |i|
#         if array[i] > array[i+1]
#           array[i], array[i+1] = array[i+1], array[i]
#           swapped = true
#         end
#       end

#       break if not swapped
#     end

#    puts  array
#   end

#   bubble_sort(a)
