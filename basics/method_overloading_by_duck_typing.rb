class Test
  def add
    p "Test class method"
  end
end

class Test1
  def add(a, b)
    p "Sum is #{a + b}"
  end
end

def test(item, *args)
  item.add(*args)
end

# Test the code
test(Test.new)             # Calls Test#add, prints "Test class method"
test(Test1.new, 3, 4)      # Calls Test1#add with arguments, prints "Sum is 7"

# Polymorphism allows objects of different classes to be treated as objects of a common superclass.
# It is achieved through method overriding and duck typing in Ruby.

# ruby basics/method_overloading_by_duck_typing.rb