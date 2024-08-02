# ruby adv/ducktyping.rb

# Duck typing is a concept in programming languages like Ruby that relies on the principle that the suitability of an object is
# determined by the presence of certain methods and properties, rather than the object's class itself.

# The << operator in Ruby is polymorphic: it works with strings and arrays, demonstrating duck typing.
# The method test works as long as the first argument responds to the << method, regardless of its specific class.

class DTest
  def test(a, b)
    a << b
  end
end

d = DTest.new
# p d.methods
# p d.methods.sort

str = "sample "
p d.test(str,"test")

arr = [1, 2, 3, 4]
p d.test(arr, 5)
p d.test(arr, str)
