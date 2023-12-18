# Memoization is a technique used to optimize expensive or time-consuming operations by caching their results and
#  reusing them when the same inputs are provided. This is particularly useful for functions with expensive 
#  calculations or remote API calls that don't change often.

# In Ruby, you can implement memoization using instance variables and conditional assignment.

#Here's an example:

class ExpensiveCalculation
  def calculate(input)
    @result ||= {}
    @result[input] ||= begin
      puts "Performing expensive calculation for #{input}"
      # Simulate an expensive operation
      sleep(1)
      input * 2
    end
  end
end

calc = ExpensiveCalculation.new

puts calc.calculate(10)  # Performs the expensive calculation
puts calc.calculate(10)  # Returns the cached result
puts calc.calculate(20)  # Performs the expensive calculation

# In this example, we use an instance variable @result to store the results of the expensive calculations. 
# The ||= operator is used to assign the result only if it hasn't been calculated before. This way, the expensive calculation is 
# performed only once for each unique input.