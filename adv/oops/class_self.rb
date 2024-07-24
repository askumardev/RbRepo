# In Ruby, class << self is a construct that opens up the singleton class 
# (also known as the metaclass or eigenclass) of an object. 
# This is useful for defining methods that are specific to a single instance or for 
# adding class methods directly inside a class definition.
class MyClass
  class << self
    def class_method
      puts "I'm a class method!"
    end
  end

  def instance_method
    puts "I'm an instance method!"
  end
end

MyClass.class_method # => "I'm a class method!"
obj = MyClass.new
obj.instance_method  # => "I'm an instance method!"

# In the above example:

# class << self opens the singleton class of MyClass.
# Inside this singleton class, class_method is defined as a class method.
# instance_method is defined normally and is available to instances of MyClass.
# Use Cases
# Defining Class Methods: This is a common way to define class methods within a class definition.

# Modifying Singleton Classes: It allows for modifications that are specific to a single object.

# Encapsulation: It can encapsulate class-level behavior within the class definition, providing a 
# clearer structure and separation of instance-level and class-level code.

class MyClass
  def define_singleton_method
    class << self
      def unique_method
        puts "I'm a singleton method on this instance!"
      end
    end
  end
end

obj = MyClass.new
obj.define_singleton_method
obj.unique_method # => "I'm a singleton method on this instance!"