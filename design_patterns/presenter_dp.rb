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
