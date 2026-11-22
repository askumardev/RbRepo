# Bridge:
# Decouples an abstraction from multiple implementations so they can vary independently.

class Renderer
  def render_circle(radius)
    raise NotImplementedError
  end
end

class VectorRenderer < Renderer
  def render_circle(radius)
    "Vector circle with radius #{radius}"
  end
end

class RasterRenderer < Renderer
  def render_circle(radius)
    "Pixel circle with radius #{radius}"
  end
end

class Shape
  def initialize(renderer)
    @renderer = renderer
  end
end

class Circle < Shape
  def initialize(renderer, radius)
    super(renderer)
    @radius = radius
  end

  def draw
    @renderer.render_circle(@radius)
  end
end

puts Circle.new(VectorRenderer.new, 5).draw
puts Circle.new(RasterRenderer.new, 5).draw
