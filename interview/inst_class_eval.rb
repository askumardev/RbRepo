# ruby interview/inst_class_eval.rb

class Person
end

Person.class_eval do
  def say_hello
   "Hello!"
  end
end

jimmy = Person.new
p jimmy.say_hello # "Hello!"
# In this example, class_eval allows us to define a method within the Person class outside of its original definition and without reopening the class with the standard syntax. This could be useful when the class you want to add this method to is not known until runtime.


Person.instance_eval do
  def human?
    true
  end
end

p Person.human? # true

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
