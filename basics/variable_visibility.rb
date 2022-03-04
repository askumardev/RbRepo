# This program demonstrates the functionality of class variables
class Vehicle
  @@vehicle = "Sample vehicle"

  def self.vehicle
    @@vehicle = "self vehicle"
  end

  def vehicle
    @@vehicle = "not self vehicle"
  end
end

class Car < Vehicle
  #@@vehicle is "Sample Vehicle" here
  def vehicle
    #@@vehicle is "self vehicle" here
    @@vehicle = "dummy vehicle"
    #@@vehicle is "dummy vehicle" here
    puts @@vehicle
  end
end

puts  Vehicle.new.vehicle #not self vehicle
puts Vehicle.vehicle      #self vehicle
puts Car.vehicle          #self vehicle
puts Car.new.vehicle      #dummy vehicle