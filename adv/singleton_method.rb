obj = "hello"

# Define a singleton method for the object `obj`
def obj.greet
  "Hello from the singleton method!"
end

puts obj.greet
p obj

# Singleton Method Defined: The greet method is defined only for the obj object, which is the string "hello". 
# It does not affect any other strings.

# Calling the Method: When you call obj.greet, it will execute the greet method defined specifically for this instance. 
# The output will be "Hello from the singleton method!".