# ruby basics/constant.rb

class Message
  DEFAULT_MESSAGE = "Hello"

  def speak(message = nil)
    if message
      puts message
    else
      puts DEFAULT_MESSAGE
    end
  end
end

#Message.DEFAULT_MESSAGE = "HELLO"
msg = Message.new
pp msg.speak("HELLO")


pp("------------integer constants---------")
class MathOperations
  # Define constants
  PI = 3.14159
  EULER = 2.71828

  # A method that uses the constants
  def self.circle_area(radius)
    PI * radius**2
  end

  def self.exponential_power(base, exponent)
    EULER**exponent
  end
end

# Accessing the constants and using the methods
puts "The value of PI: #{MathOperations::PI}"
puts "The value of EULER: #{MathOperations::EULER}"

radius = 5
area = MathOperations.circle_area(radius)
puts "The area of a circle with radius #{radius} is #{area}"

base = 2
exponent = 3
result = MathOperations.exponential_power(base, exponent)
puts "The result of #{base} to the power of #{exponent} using EULER: #{result}"

pp("------------instance_eval---------")
# In Ruby, constants are designed to be, well, constant, and changing their values is generally not recommended. 
# However, it's technically possible to change the value of a constant using instance_eval or class_eval, 
# but this is considered bad practice and can lead to unexpected behavior.

class MyClass
  MY_CONSTANT = 42

  def change_constant(new_value)
    self.class.instance_eval do
      remove_const(:MY_CONSTANT)
      const_set(:MY_CONSTANT, new_value)
    end
  end
end

obj = MyClass.new
puts "Initial value of MY_CONSTANT: #{MyClass::MY_CONSTANT}"
obj.change_constant(99)
puts "Updated value of MY_CONSTANT: #{MyClass::MY_CONSTANT}"

