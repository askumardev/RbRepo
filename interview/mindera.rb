# Sum of consicutive array elements without methods
a = [1,3,4,6,12,5]
b = []
i = 0
max = 0
a.each do |s|
  break if i == a.length-1
  sum = a[i] + a[i+1]
  if sum > max
    max = sum
    b = [a[i], a[i+1]]
  end
  i = i+1
end
puts b.inspect

#no.of occurances of array elemets without methods
arr = [3,3,5,5,5,10,4,6,6]
b = {}
arr.each do |s|
  num = b[s] || 1
  if b[s]
    b[s] = b[s] + 1
  else
    b.merge!(s=>num)
  end
end
puts b.inspect