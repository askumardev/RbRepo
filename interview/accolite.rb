arr = [1,2,3,4,5,6]
#output = [4,5,6,1,2,3]
index = 3
new = []
index.times do |x|
  new << arr.shift
end
new = arr + new
p new