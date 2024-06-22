require 'no_increase'

describe 'no_of_increases' do
  it 'counts one increase' do
    num = number_of_increases([1, 2])
    expect(num).to eq(1)
  end

  it 'counts two increases' do
    num = number_of_increases([1, 2, 3])
    expect(num).to eq(2)
  end

  it 'counts two increases with a decrease' do
    num = number_of_increases([4, 1, 2, 3, 1])
    expect(num).to eq(2)
  end

  it 'works for input' do
    input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    num = number_of_increases(input)
    expect(num).to eq(7)
  end
end