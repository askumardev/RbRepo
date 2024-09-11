# In Ruby, the ||= operator is a common idiom used to assign a value to a variable if the variable is either 
# nil or false. Essentially, it is a conditional assignment operator. It is a shorthand for:


# variable = variable || value
# In other words, if variable is nil or false, it gets assigned the value on the right-hand side. 
# If variable already has a truthy value (anything other than nil or false), it remains unchanged.

a = nil
a ||= 10
puts a # => 10

b = false
b ||= 20
puts b # => 20

c = "hello"
c ||= 30
puts c # => "hello"
