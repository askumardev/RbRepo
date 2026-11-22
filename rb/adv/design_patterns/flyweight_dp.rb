# Flyweight:
# Shares intrinsic state among many objects to reduce memory usage.

class Character
  def initialize(font, color)
    @font = font
    @color = color
  end

  def draw(position)
    "Draw #{@font}/#{@color} character at #{position}"
  end
end

class CharacterFactory
  def initialize
    @characters = {}
  end

  def character(font, color)
    key = [font, color]
    @characters[key] ||= Character.new(font, color)
  end
end

factory = CharacterFactory.new
first = factory.character("Arial", "blue")
second = factory.character("Arial", "blue")

puts first.draw([10, 20])
puts "Same shared object: #{first.equal?(second)}"
