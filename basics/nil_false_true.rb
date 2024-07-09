# ruby basics/nil_false_true.rb

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