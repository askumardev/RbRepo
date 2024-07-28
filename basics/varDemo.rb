# ruby basics/varDemo.rb

#Local Variables
p "----Local Variables----"
5.times do
  x = 10
  p x
end
# p x # will get error  undefined local variable or method `x' for main:Object (NameError

# Global
p "----Global Variables----"
5.times do
  $x = 20
end
p $x
