# In Ruby, the ||= operator is a common idiom used to assign a value to a variable
# if the variable is either nil or false.
# Essentially, it is a conditional assignment operator. It is a shorthand for:

# variable = variable || value

# In other words, if variable is nil or false, it gets assigned the value on the
# right-hand side. If variable already has a truthy value
# (anything other than nil or false), it remains unchanged.

a = nil # Initialize variable a to nil
a ||= 10 # Use ||= to assign a value only if a is nil
puts a # => 10

b = false # # If b already has a value, ||= won't change it
b ||= 20
puts b # => 20

c = "hello"
c ||= 30
puts c # => "hello"

# This is a convenient way to set default values for variables.
# If the variable already has a value, the "||=" operator won't override it.

puts "----------------------"
x = nil # Initialize variable x to nil
x ||= 10 # Use ||= to assign a value only if x is nil
puts x  # Output: 10

x ||= 20 # If x already has a value, ||= won't change it
puts x  # Output: 10 (unchanged)
