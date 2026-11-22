# Example 1: Raising a built-in exception
# ruby rb/adv/exceptions/raise_exception.rb


# Example 1: Built-in exception handling

def divide_numbers(dividend, divisor)
  raise ArgumentError, "Divisor cannot be zero" if divisor.zero?

  dividend / divisor
end

begin
  result = divide_numbers(10, 2)
  puts "Result of division: #{result}"

  result = divide_numbers(8, 0)
  puts "Result of division: #{result}"

rescue ArgumentError => e
  puts "Caught an ArgumentError: #{e.message}"

rescue ZeroDivisionError => e
  puts "Caught a ZeroDivisionError: #{e.message}"

ensure
  puts "Division operation completed."
end

p "-------------------"
# Example 2: Custom exception

class CustomError < StandardError
end

def check_value(value)
  raise CustomError, "Value cannot be negative" if value.negative?

  puts "Value is: #{value}"
end

begin
  check_value(5)
  check_value(-3)

rescue CustomError => e
  puts "Caught a CustomError: #{e.message}"

ensure
  puts "Value validation completed."
end
