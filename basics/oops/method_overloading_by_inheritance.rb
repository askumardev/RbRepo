class Base
  def add(a, b)
    p "Base class: Sum is #{a + b}"
  end
end

# class Derived < Base
#   def add(a, b, c = 0)
#     p "Derived class: Sum is #{a + b + c}"
#   end
# end

class Derived < Base
  def add(*args)
    sum = args.sum
    p "Derived class: Sum is #{sum}"
  end
end

# Test the code
base_obj = Base.new
derived_obj = Derived.new

base_obj.add(2, 3)            # Calls Base#add, prints "Base class: Sum is 5"
derived_obj.add(2, 3)         # Calls Derived#add with 2 arguments, prints "Derived class: Sum is 5"
derived_obj.add(2, 3, 4)      # Calls Derived#add with 3 arguments, prints "Derived class: Sum is 9"
derived_obj.add(2, 3, 4, 5) 
derived_obj.add(2, 3, 4, 5, 6) 

# ruby basics/method_overloading_by_inheritance.rb