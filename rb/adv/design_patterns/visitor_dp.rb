# Visitor:
# Separates an operation from the object hierarchy it operates on.

class Shape
  def accept(visitor)
    raise NotImplementedError
  end
end

class CircleShape < Shape
  attr_reader :radius

  def initialize(radius)
    @radius = radius
  end

  def accept(visitor)
    visitor.visit_circle(self)
  end
end

class SquareShape < Shape
  attr_reader :side

  def initialize(side)
    @side = side
  end

  def accept(visitor)
    visitor.visit_square(self)
  end
end

class AreaVisitor
  def visit_circle(circle)
    Math::PI * circle.radius**2
  end

  def visit_square(square)
    square.side**2
  end
end

visitor = AreaVisitor.new
puts CircleShape.new(2).accept(visitor).round(2)
puts SquareShape.new(3).accept(visitor)
