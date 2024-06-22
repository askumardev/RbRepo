# The Decorator pattern allows behavior to be added to 
# individual objects, dynamically, without affecting the behavior of other objects from the same class.

class Coffee
  def cost
    2.00
  end

  def description
    "Coffee"
  end
end

class MilkDecorator
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost + 0.50
  end

  def description
    @coffee.description + ", Milk"
  end
end

class SugarDecorator
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost + 0.25
  end

  def description
    @coffee.description + ", Sugar"
  end
end

coffee = Coffee.new
coffee = MilkDecorator.new(coffee)
coffee = SugarDecorator.new(coffee)

puts coffee.description  # Output: Coffee, Milk, Sugar
puts coffee.cost         # Output: 2.75


# ruby design_patterns/decorator_dp.rb