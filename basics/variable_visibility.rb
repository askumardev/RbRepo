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
  @@vehicle = "Car vehicle"
end
vehi = Vehicle.new
p vehi.vehicle
p Vehicle.vehicle
p Car.vehicle