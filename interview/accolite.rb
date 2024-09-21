arr = [1,2,3,4,5,6]
#output = [4,5,6,1,2,3]
index = 3
new = []
index.times do |x|
  new << arr.shift
end
p arr  #[4, 5, 6]
p new  #[1, 2, 3]
new = arr + new
p new

# ruby interview/accolite.rb