# ruby solid/liskov_substitution_principle.rb

class Bird
end

class FlyingBird < Bird
  def fly
    puts "Flying"
  end
end

class Penguin < Bird
  def swim
    puts "Swimming"
  end
end


puts "--- Testing FlyingBird ---"
eagle = FlyingBird.new
eagle.fly  # Outputs: Flying

puts "\n--- Testing Penguin ---"
pingu = Penguin.new
pingu.swim # Outputs: Swimming