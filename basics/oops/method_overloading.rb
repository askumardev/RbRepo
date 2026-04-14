class Calculator
  def add(*args)
    sum = 0
    args.each do |arg|
      sum += arg
    end
    sum
  end
end

# Usage
calc = Calculator.new

puts calc.add()  
puts calc.add(5)              # Output: 5
puts calc.add(5, 3)           # Output: 8
puts calc.add(5, 3, 2)        # Output: 10
puts calc.add(1, 2, 3, 4, 5)  # Output: 15


# ruby basics/method_overloading.rb
