require 'submarine'

describe Submarine do
  describe 'down' do
    it 'increases depth' do
      sub = Submarine.new
      expect(sub.dep).to eq(0)
      # dep = sub.depth
      sub.down(2)
      expect(sub.dep).to eq(2)
    end
  end

  describe 'up' do
    it 'decreases depth' do
      sub = Submarine.new
      expect(sub.dep).to eq(0)
      # dep = sub.depth
      sub.up(2)
      expect(sub.dep).to eq(-2)
    end
  end

  describe 'forward' do
    it 'increases position' do
      sub = Submarine.new
      expect(sub.position).to eq(0)
      # dep = sub.depth
      sub.forward(2)
      expect(sub.position).to eq(2)
    end
  end

  it 'works for the input' do
    sub = Submarine.new
    sub.forward 5
    sub.down 5
    sub.forward 8
    sub.up 3
    sub.down 8
    sub.forward 2
    expect(sub.location).to eq(150)
  end

  it 'works with dsl' do
    sub = Submarine.new do
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    end
    expect(sub.location).to eq(150)
  end
end