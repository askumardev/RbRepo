arr1 = ["name","description","rating", :a]
arr2 = ["Godrej","A godrej brand","5", 1]

hsh = {}

arr1.each_with_index do |e,i|
  hsh[e] = arr2[i]
end
p hsh

# ruby arr_hsh/hsh_from_two_arrs.rb