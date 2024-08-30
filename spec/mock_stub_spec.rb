class Calculator
  def add(a, b)
    a + b
  end
end

describe Calculator do
  it 'returns the sum of two numbers using the calculator' do
    calculator = Calculator.new

    # Stubbing the add method of Calculator
    allow(calculator).to receive(:add).with(2, 3).and_return(5)

    result = calculator.add(2, 3)
    expect(result).to eq(5)
  end
end

describe Calculator do
  it 'calls the add method on the calculator with the correct arguments' do
    calculator = double("Calculator")

    # Mocking the add method
    expect(calculator).to receive(:add).with(2, 3).and_return(5)

    result = calculator.add(2, 3)
    expect(result).to eq(5)
  end
end