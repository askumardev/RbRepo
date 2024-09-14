arr = [1, 6, 7, 3, 0]
sum = 10
index = []
arr.combination(2).each do |x|
  index << x if x.sum == sum
end

p index.flatten!
p arr.find_index(index[0])
p arr.find_index(index[1])

def convert(num)
  first, second = num.to_s.split('.')  #["2","1"]

  if second[0].to_i > 5
    result = first.to_i + 1
  else
    result = first.to_i + 0.5
  end
  result
end

puts convert(2.1)   #2.5


module Sample
  def name
    "satish"
  end
end

class IncludeDemo
  include Sample
end

class ExtendDemo
  extend Sample
end

i = IncludeDemo.new
p i.name

p ExtendDemo.name
