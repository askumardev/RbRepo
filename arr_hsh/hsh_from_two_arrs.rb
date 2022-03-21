arr1 = ["name","description","rating"]
arr2 = ["Godrej","A godrej brand","5"]

hsh = {}

arr1.each_with_index do |e,i|
  hsh[e] = arr2[i]
end
p hsh