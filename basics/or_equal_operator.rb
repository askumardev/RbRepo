# ruby basics/or_equal_operator.rb

# In Ruby, the "||=" operator is used to assign a value to a variable only if that variable
# is currently nil or false. Here's an example:

x = nil # Initialize variable x to nil

x ||= 10 # Use ||= to assign a value only if x is nil

puts x  # Output: 10

x ||= 20 # If x already has a value, ||= won't change it

puts x  # Output: 10 (unchanged)

# This is a convenient way to set default values for variables. 
# If the variable already has a value, the "||=" operator won't override it.