# ruby ds/LinkedList/single_list.rb

a = [1, 2, 3, 4, 5, 6, 7, 8]
def insert(arr, item, pos)
  tmp      = arr[pos]
  arr[pos] = item
  puts arr[pos + 1..-1]
  arr.replace(arr[0..pos] + [tmp] + arr[pos + 1..-1])
end
insert(a, 99, 3)
p a
