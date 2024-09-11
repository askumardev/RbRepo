# The Presenter Design Pattern is often used in the context of the Model-View-Presenter (MVP) architecture. 
# MVP separates the concerns of application logic, user interface, and presentation logic, 
# making your code more maintainable and testable.

# In MVP, the Presenter handles the presentation logic. It acts as an intermediary between the 
# Model (which contains the business logic) and the View (which is responsible for the user interface).

# Here's an example of the Presenter Design Pattern implemented in Ruby:

# Components
# Model: Represents the data and business logic.
# View: Displays the data and sends user actions to the Presenter.
# Presenter: Contains the presentation logic and interacts with both the Model and the View.


# ruby design_patterns/presenter_dp.rb

# Model
class Calculator
  def add(a, b)
    a + b
  end
end

# View
class CalculatorView
  def get_input
    puts "Enter first number:"
    a = gets.chomp.to_i
    puts "Enter second number:"
    b = gets.chomp.to_i
    [a, b]
  end

  def display_result(result)
    puts "Result: #{result}"
  end
end

# Presenter
class CalculatorPresenter
  def initialize(model, view)
    @model = model
    @view = view
  end

  def run
    input = @view.get_input
    result = @model.add(input[0], input[1])
    @view.display_result(result)
  end
end

# Usage
calculator_model = Calculator.new
calculator_view = CalculatorView.new
calculator_presenter = CalculatorPresenter.new(calculator_model, calculator_view)
calculator_presenter.run
