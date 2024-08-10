# ruby basics/method_resolution.rb

module MyModule
  def my_method
    puts 'Module method'
  end
end

class Parent
  include MyModule

  def my_method
    puts 'Parent method'
  end
end

class Child < Parent
  def my_method
    puts 'Child method'
  end
end

obj = Child.new
obj.my_method


# Child: Ruby finds the my_method in Child and executes it.
# Parent: This would be checked if my_method wasn't defined in Child.
# MyModule: This is checked if neither Child nor Parent defined my_method.
# Since Child has its own my_method, it takes precedence over the methods defined in Parent or MyModule.