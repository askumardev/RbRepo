# ruby basics/class_var_scope.rb

# Defined within the Class:

# Class variables are defined within the class body and are prefixed with @@.
# They are shared among all instances of the class and its subclasses.
# ruby
# Copy code
class Example
  @@class_variable = "I am a Example class variable"
end

# Accessible within the Class and Subclasses:

# Class variables are accessible within the class and its subclasses.
# This allows data to be shared across different instances of the same class hierarchy.
# ruby
# Copy code
class Parent
  @@class_variable = "I am a Parent class variable"
end

class Child < Parent
  def print_class_variable
    puts @@class_variable
  end
end

obj = Child.new
obj.print_class_variable # Output: "I am a class variable"

# Shared Among Instances:

# Changes made to a class variable are reflected across all instances of the class and its subclasses.
# ruby
# Copy code
class Example
  @@class_variable = "Initial value"

  def update_class_variable
  	new_value = "Updated value"
    @@class_variable = new_value
  end
end

obj1 = Example.new
obj2 = Example.new

# puts obj1.class_variable # Output: "Initial value"
# puts obj2.class_variable # Output: "Initial value"
# puts Example.class_variable # Output: "Initial value"
# puts Example.class_variable # Output: "Initial value"

# obj1.update_class_variable("Updated value")

puts obj1.update_class_variable # Output: "Updated value"
puts obj2.update_class_variable # Output: "Updated value"

# Inheritance and Class Hierarchy:

# Class variables are inherited by subclasses, and changes made in subclasses affect the
# value in the superclass and vice versa.
# ruby
# Copy code
class Parent
  @@class_variable = "I am a class variable"
end

# class Child < Parent
# end

# puts Child.class_variable # Output: "I am a class variable"

# Modifying in the subclass affects the superclass
# Child.class_variable = "Modified value"
# puts Parent.class_variable # Output: "Modified value"

# Caution: Shared State:

# While class variables can be useful for sharing data among instances, they should be used with caution.
# Shared state can lead to unexpected behavior and can make the code less modular and harder to maintain.
# It's important to be mindful of the use of class variables and consider alternatives like instance
# variables or class methods, depending on the specific requirements of your code.
# Understanding the scope of class variables is crucial for writing maintainable and predictable
# code in object-oriented programming with Ruby.
