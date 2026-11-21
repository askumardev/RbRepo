class Greeter
  def method_missing(method_name, *args, &block)
    method_name_string = method_name.to_s
    
    # Check if the method name starts with "greet_"
    if method_name_string.start_with?("greet_")
      # Extract the name after "greet_"
      name = method_name_string.split('_', 2).last
      "Hello, #{name.capitalize}!"
    else
      # Call the original method_missing to handle other undefined methods
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name_string = method_name.to_s.start_with?("greet_") || super
  end
end

greeter = Greeter.new

puts greeter.greet_john    # => "Hello, John!"
puts greeter.greet_jane    # => "Hello, Jane!"
puts greeter.greet_alex    # => "Hello, Alex!"

# Check if it responds to dynamically handled methods
puts greeter.respond_to?(:greet_john)    # => true
puts greeter.respond_to?(:greet_unknown) # => true

# Check if it responds to an undefined method not handled by method_missing
puts greeter.respond_to?(:unknown_method) # => false

# Explanation:
# Override method_missing:

# The method_missing method is overridden to handle undefined methods.
# If the method name starts with greet_, it extracts the name part after greet_ and returns a greeting string.
# If the method name does not start with greet_, it calls super to handle other undefined methods properly.
# Override respond_to_missing?:

# The respond_to_missing? method is overridden to ensure the object correctly responds to respond_to? for methods starting with greet_.
# It returns true if the method name starts with greet_, otherwise, it calls super.
# Example usage:

# The object greeter can dynamically handle methods like greet_john, greet_jane, and greet_alex, which are not explicitly defined in the class.
# It returns custom greeting strings for these methods.
# The respond_to? method correctly indicates that the object can respond to dynamically handled methods.