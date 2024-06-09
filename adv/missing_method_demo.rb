class DynamicMethodHandler
  def initialize
    @attributes = {}
  end

  def method_missing(method_name, *args, &block)
    method_name_string = method_name.to_s
    
    # Check if the method is a getter
    if method_name_string =~ /=$/
      attribute = method_name_string.chomp('=').to_sym
      @attributes[attribute] = args.first
    elsif @attributes.key?(method_name)
      @attributes[method_name]
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name_string = method_name.to_s
    if method_name_string =~ /=$/ || @attributes.key?(method_name)
      true
    else
      super
    end
  end
end

obj = DynamicMethodHandler.new
obj.name = "ChatGPT"
puts obj.name # => "ChatGPT"

obj.age = 2023
puts obj.age # => 2023

puts obj.respond_to?(:name) # => true
puts obj.respond_to?(:unknown_method) # => false

# Explanation:
# Initialize an attributes hash: The class DynamicMethodHandler has an instance variable @attributes which is a hash to store dynamically assigned attributes.

# Override method_missing: The method_missing method is overridden to handle undefined methods:

# If the method name ends with an = (setter method), it treats it as an attribute assignment and stores the value in @attributes.
# If the method name matches an existing key in @attributes, it returns the value associated with that key.
# If the method name doesn't match these conditions, it calls super to ensure that NoMethodError is raised for truly undefined methods.
# Override respond_to_missing?: To make sure that the object correctly responds to respond_to? for dynamically handled methods, respond_to_missing? is also overridden.

# Example usage: The object obj can dynamically handle methods name and age, which aren't explicitly defined in the class. The values are stored and retrieved using the @attributes hash.