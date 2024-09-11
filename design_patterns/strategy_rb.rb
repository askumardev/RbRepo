# The Strategy pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable.
# It lets the algorithm vary independently from clients that use it.

class Context
  def initialize(strategy)
    @strategy = strategy
  end

  def execute_strategy(a, b)
    @strategy.execute(a, b)
  end
end

class Strategy
  def execute(a, b)
    raise NotImplementedError, "This method should be overridden"
  end
end

class AddStrategy < Strategy
  def execute(a, b)
    a + b
  end
end

class MultiplyStrategy < Strategy
  def execute(a, b)
    a * b
  end
end

context = Context.new(AddStrategy.new)
puts context.execute_strategy(3, 4)  # Output: 7

context = Context.new(MultiplyStrategy.new)
puts context.execute_strategy(3, 4)  # Output: 12

# ruby design_patterns/strategy_dp.rb