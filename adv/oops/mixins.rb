# ruby basics/ObjClsOop/mixins.rb

# Define a module with some methods
module Greetings
  def say_hello
    puts "Hello!"
  end

  def say_goodbye
    puts "Goodbye!"
  end
end

# Create a class and include the Greetings module
class Person
  include Greetings
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# Create an instance of the Person class
person = Person.new("John")

# Call methods from the Greetings module
person.say_hello   # Output: Hello!
person.say_goodbye # Output: Goodbye!
