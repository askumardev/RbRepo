# Run with: ruby rb/adv/exceptions/exceptions_demo.rb
#
# The rescue block handles failures.
# The else block runs only when no exception was raised.
# The ensure block always runs, whether an exception occurred or not.

def divide_numbers(dividend, divisor)
  begin
    result = dividend / divisor
    puts "Result of division: #{result}"
  rescue ZeroDivisionError => e
    puts "Error: #{e.message}. Cannot divide by zero."
  rescue StandardError => e
    puts "Caught an exception: #{e.message}"
  else
    puts "Division completed successfully."
  ensure
    puts "This ensures that this block always runs, regardless of exceptions."
  end
end

# Example usage
divide_numbers(10, 2)  # Result of division: 5, ensures block runs
p "------------------"
divide_numbers(8, 0)   # Error: divided by 0. Cannot divide by zero., ensures block runs
p "------------------"
divide_numbers("a", 2) # Caught an exception: undefined method `/' for "a":String, ensures block runs
