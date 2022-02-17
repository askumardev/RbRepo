require 'pry'
def add_without_plus(a, b)
  while b != 0
    data = a & b
    a = a ^ b
    b = data << 1
  end
  return a  
end

p add_without_plus(10,5)
p add_without_plus(0,5)
p add_without_plus(20,30)