#Local Variables
5.times do
  x = 10
  p x	
end
# p x # will get error  undefined local variable or method `x' for main:Object (NameError

# Global
5.times do
  $x = 20
end
p $x