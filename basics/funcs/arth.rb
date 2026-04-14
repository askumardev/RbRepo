# ruby basics/arth.rb

def arth(num1, num2)
  num1 + num2
  num1 - num2
  num1 * num2
  num1 / num2
end
puts arth(6, 3)

def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(a, b)
  a * b
end

def divide(a, b)
  a / b
end

puts add(subtract(80,10), multiply(20,6))  # add(70,120)
