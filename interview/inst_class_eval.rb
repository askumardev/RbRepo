# ruby interview/inst_class_eval.rb

p "--------------------class_eval---------------------------------"
# class_eval
# Context: Evaluates the code in the context of a class.
# Usage: Modifies the class itself, like adding methods or constants.
# Alias: Also known as module_eval when used with modules.
class MyClass1
end

# Adding methods to MyClass1 using class_eval
MyClass1.class_eval do
  def hello1
    "Hello1!"
  end

  def hello2
    "Hello2!"
  end
end
# class_eval is used to add a method hello to MyClass. This method becomes available to all instances of MyClass.

p "--------------------instance_eval---------------------------------"
# instance_eval
# Context: Evaluates the code in the context of an instance.
# Usage: Modifies a specific instance, like adding singleton methods or accessing instance variables.
# Scope: Within the block, self refers to the instance, not the class.

class MyClass2
end

obj2 = MyClass2.new
# Adding methods to MyClass2 using instance_eval
obj2.instance_eval do
  def hello3
    "Hello3!"
  end

  def hello4
    "Hello4!"
  end
end

# Creating instances
obj1 = MyClass1.new


# Testing methods
puts obj1.hello1  # Output: Hello1!
puts obj1.hello2  # Output: Hello2!

puts obj2.hello3  # Output: Hello3!
puts obj2.hello4

# This example of instance_eval is similar, but evaluates the code in the context of an instance instead of a class.
# This is confusing at first, because in these examples class_eval creates instance methods and instance_eval creates class methods.
# There is reason behind the madness, however.

# class_eval is a method of the Module class, meaning that the receiver will be a module or a class.
# The block you pass to class_eval is evaluated in the context of that class.
# Defining a method with the standard def keyword within a class defines an instance method, and that's exactly what happens here.

# instance_eval, on the other hand, is a method of the Object class, meaning that the receiver will be an object.
# The block you pass to instance_eval is evaluated in the context of that object.
# That means that Person.instance_eval is evaluated in the context of the Person object.
# Remember that a class name is simply a constant which points to an instance of the class Class.
# Because of this fact, defining a method in the context of Class instance referenced by Person creates a class method for Person class.

# It may be difficult to wrap your mind around that if you're not familiar with the Ruby object model,
# but it's still easy to remember how these methods behave with a simple mnemonic device: when called on a class name constant,
# these two methods will allow you to create methods of the opposite type from their names.
# MyClass.class_eval will create instance methods and MyClass.instance_eval will create class methods.
