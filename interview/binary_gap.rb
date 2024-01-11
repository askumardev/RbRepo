# ruby interview/binary_gap.rb

def longest_consecutive_zeroes(n)
  binary_representation = n.to_s(2)
  max_length = 0
  current_length = 0

  binary_representation.each_char do |bit|
    if bit == '0'
      current_length += 1
      max_length = [max_length, current_length].max
    else
      current_length = 0
    end
  end

  max_length
end

# Example usage:
number = 14
result = longest_consecutive_zeroes(number)
puts "Binary gap of #{number}: #{result}"