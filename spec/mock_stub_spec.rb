class Calculator
  def add(a, b)
    a + b
  end
end

describe Calculator do
  # Stub:
  it 'returns the sum of two numbers using the calculator' do
    calculator = Calculator.new

    # Stubbing the add method of Calculator
    # Uses a real Calculator object.
    # Focuses on controlling the output of the add method using allow.
    # Does not check whether add was called, only that when it is called with certain arguments, it
    # returns a specific value.
    allow(calculator).to receive(:add).with(2, 3).and_return(5)
    # Mock another parameter set: Expect add(4, 5) to be called and return 10
    expect(calculator).to receive(:add).with(4, 5).and_return(10)


    result = calculator.add(2, 3)
    expect(result).to eq(5)

    result2 = calculator.add(4, 5)  # Must call with exact args for second mock
    expect(result2).to eq(10)
  end
end

describe Calculator do
  # Mock example: Verify the call happened with exact arguments
  it 'calls the add method on the calculator with the correct arguments' do
    calculator = double("Calculator")

    # Mocking the add method
    # Uses a double instead of a real Calculator object.
    # Focuses on verifying that the add method is called with specific arguments using expect.
    # Controls both the method call and its return value, ensuring the interaction happens as expected.
    expect(calculator).to receive(:add).with(2, 3).and_return(5)
     # Mock another parameter set: Expect add(4, 5) to be called and return 10
    expect(calculator).to receive(:add).with(4, 5).and_return(10)


    result = calculator.add(2, 3)
    expect(result).to eq(5)

    result2 = calculator.add(4, 5)  # Must call with exact args for second mock
    expect(result2).to eq(10)
  end
end


# Mocks are stricter—if the method isn't called or args don't match, the test fails.
# Stubs are looser, useful for avoiding side effects without caring about calls.
