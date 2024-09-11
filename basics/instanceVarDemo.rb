class Engine
  def initialize
    puts "Engine is starting..."
  end
  def start
    puts "Engine started..."
  end
end

class Car
  def initialize
    @engine = Engine.new  # Engine instance is created when Car is created
  end

  def start
    @engine.start
  end
end

my_car = Car.new
my_car.start