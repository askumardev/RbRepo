# ruby basics/nil_false_true.rb

# In Ruby, nil, false, and true are special objects that represent the concepts of 
# "nothing," "falseness," and "truth," respectively.

# nil is an object of the NilClass and represents the absence of a value or nothingness. 
# It is commonly used to indicate that a variable, method, or expression has no value. In Ruby, nil is considered "falsy."

# false is an object of the FalseClass and represents a boolean false value. 
# When a condition evaluates to false, it means the condition is not met. In Ruby, false is considered "falsy."

# true is an object of the TrueClass and represents a boolean true value. 
# When a condition evaluates to true, it means the condition is met. In Ruby, true is considered "truthy."

# All values in Ruby, other than nil and false, are considered "truthy." 
# This means that when used in a condition, they will be treated as true. 

def check_value(value)
  if value
    puts "The value '#{value}' is considered truthy."
  else
    puts "The value '#{value}' is considered falsy."
  end
end

check_value(nil)    # Output: "The value '' is considered falsy."
check_value(false)  # Output: "The value 'false' is considered falsy."
check_value(true)   # Output: "The value 'true' is considered truthy."
check_value(0)      # Output: "The value '0' is considered truthy."
check_value("")     # Output: "The value '' is considered truthy."