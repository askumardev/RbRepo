# number is defined using let and is only evaluated when it is first accessed within the test.

RSpec.describe 'Example1' do
  let(:number) { 1 + 1 }
  #p number
  it 'uses the let variable' do
    expect(number).to eq(2)
  end
end

# number is defined using let!, so it is evaluated before the example starts, even if it is not explicitly accessed in the test.
RSpec.describe 'Example2' do
  let!(:number) { 1 + 1 }
  #p number
  it 'uses the let! variable' do
    expect(number).to eq(2)
  end
end
