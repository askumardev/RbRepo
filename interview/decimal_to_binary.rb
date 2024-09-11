# ruby interview/decimal_to_binary.rb

def decimal_to_binary(decimal_number)
  return '0' if decimal_number == 0

  binary = ''
  while decimal_number > 0
    binary = (decimal_number % 2).to_s + binary
    decimal_number /= 2
  end

  return binary
end


# Output
puts decimal_to_binary(10) # Output: "1010"
puts decimal_to_binary(42) # Output: "101010"
puts decimal_to_binary(255) # Output: "11111111"