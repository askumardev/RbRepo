# ruby basics/yield_demo.rb

# The yield keyword in Ruby is used to execute a block of code that is passed as an argument to a method. 
# This allows you to create flexible and reusable methods that can be customized with different blocks of code as needed.

# When a method containing the yield keyword is called with a block, the block is executed at the point where yield is encountered.
# The method can also pass arguments to the block, and the block can return a value that is used by the method.

def custom_greeting(name)
  greeting = yield name
  puts "#{greeting}, #{name}!"
end

custom_greeting("Alice") do |name|
  "Hello"
end

custom_greeting("Bob") do |name|
  "Bonjour"
end

# we define a custom_greeting method that takes a name as a parameter and uses the yield keyword to execute the provided block of code.
#  The block is responsible for generating a greeting based on the name, and the method prints the final greeting message.
# When we call the method with different blocks, we get different greeting messages for different names.


def greet(name)
  puts "Hello, #{name}!"
  yield if block_given?
  puts "Goodbye, #{name}!"
end

greet("Alice") do
  puts "How are you today?"
end