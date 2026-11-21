# Example 1: Raising a built-in exception
def divide_numbers(dividend, divisor)
  raise ArgumentError, "Divisor cannot be zero" if divisor.zero?

  result = dividend / divisor
  puts "Result of division: #{result}"
rescue ZeroDivisionError => e
  puts "Error: #{e.message}. Cannot divide by zero."
end

# Example usage
begin
  divide_numbers(10, 2)  # Result of division: 5
  divide_numbers(8, 0)   # Error: divided by 0. Cannot divide by zero.
rescue ArgumentError => e
  puts "Caught an ArgumentError: #{e.message}"
end

# Example 2: Raising a custom exception
class CustomError < StandardError
end

def check_value(value)
  raise CustomError, "Value cannot be negative" if value.negative?

  puts "Value is: #{value}"
rescue CustomError => e
  puts "Caught a CustomError: #{e.message}"
end

# Example usage
begin
  check_value(5)   # Value is: 5
  check_value(-3)  # Caught a CustomError: Value cannot be negative
rescue CustomError => e
  puts "Caught a CustomError outside the method: #{e.message}"
end
