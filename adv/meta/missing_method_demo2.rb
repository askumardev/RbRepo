class Example
  def method_missing(method_name, *args, &block)
    puts "Method name: #{method_name}"     # Prints the name of the missing method
    puts "Arguments: #{args.inspect}"      # Prints the arguments passed to the method
    puts "Block given: #{block_given?}"    # Indicates whether a block was given

    # Example of yielding to a block if one is given
    if block_given?
      block.call
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    true
  end
end

obj = Example.new
obj.some_undefined_method(1, 2, 3) { puts "Hello from the block!" }

# Output:
# Method name: some_undefined_method
# Arguments: [1, 2, 3]
# Block given: true
# Hello from the block!

# Explanation:
# method_name:

# When obj.some_undefined_method(1, 2, 3) { puts "Hello from the block!" } is called, the method some_undefined_method is not defined in the Example class.
# method_missing is triggered, and method_name is assigned the Symbol :some_undefined_method.
# args:

# The arguments 1, 2, and 3 are captured into the array args, so args becomes [1, 2, 3].
# block:

# The block { puts "Hello from the block!" } is captured into the block parameter.
# The block_given? method is used to check if a block was passed.
# If a block is given, block.call is used to execute the block, resulting in "Hello from the block!" being printed.
# super:

# If no block is given, super is called to handle the missing method with the default behavior, which will raise a NoMethodError.