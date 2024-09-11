# Abstraction involves creating abstract classes or methods that provide a template for other classes. 
# In Ruby, abstract classes are typically achieved by raising an exception if a method is not implemented by a subclass.


class Vehicle
  def start_engine
    raise NotImplementedError, "Subclasses must implement this method"
  end
end

class Car < Vehicle
  def start_engine
    "Car engine started"
  end
end

class Motorcycle < Vehicle
  def start_engine
    "Motorcycle engine started"
  end
end

car = Car.new
motorcycle = Motorcycle.new

puts car.start_engine       # => Car engine started
puts motorcycle.start_engine # => Motorcycle engine started

# Here, Vehicle is an abstract class with a start_engine method that raises an exception if not implemented by subclasses.