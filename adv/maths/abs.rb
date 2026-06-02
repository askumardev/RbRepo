# ruby adv/maths/abs.rb

# Calculates the absolute value of a number
class Abs
  def self.call(number)
    return -number if number.negative?

    number
  end
end


puts Abs.call(-10)  # => 10
puts Abs.call(5)    # => 5
puts Abs.call(0)    # => 0
puts Abs.call(-3.5) # => 3.5
