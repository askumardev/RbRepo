# ruby adv/exceptions_demo.rb

def divide_numbers(dividend, divisor)
  begin
    result = dividend / divisor
    puts "Result of division: #{result}"
  rescue ZeroDivisionError => e
    puts "Error: #{e.message}. Cannot divide by zero."
  rescue StandardError => e
    puts "Caught an exception: #{e.message}"
  ensure
    puts "This ensures that this block always runs, regardless of exceptions."
  end
end

# Example usage
divide_numbers(10, 2)  # Result of division: 5, ensures block runs
divide_numbers(8, 0)   # Error: divided by 0. Cannot divide by zero., ensures block runs
divide_numbers("a", 2) # Caught an exception: undefined method `/' for "a":String, ensures block runs
