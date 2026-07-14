class DoubleStack
  def initialize
    @stack = []
  end

  def push(element)
    @stack.push(element)
  end

  # Pop the top element from the stack
  def pop
    @stack.pop
  end

  # Get the top element without removing it
  def top
    @stack.last
  end

  # Get the second-top element without removing it
  def second_top
    @stack[-2] if @stack.length >= 2
  end

  # Check if the stack is empty
  def empty?
    @stack.empty?
  end
end

# Example Usage:
double_stack = DoubleStack.new

double_stack.push(1)
double_stack.push(2)
double_stack.push(3)

puts "Top element: #{double_stack.top}"        
puts "Second-top element: #{double_stack.second_top}"  
double_stack.pop

puts "Top element after pop: #{double_stack.top}" 
puts "Second-top element after pop: #{double_stack.second_top}"  