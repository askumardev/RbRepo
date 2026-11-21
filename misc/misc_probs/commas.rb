# ruby misc_probs/commas.rb

# Method name: commas
# Inputs:      A number, n
# Returns:     A string representing the input, with commas inserted into the
#              correct position.
# Prints:      Nothing

# For example,
#
#  commas(123)     == "123"
#  commas(1234)    == "1,234"
#  commas(12345)   == "12,345"
#  commas(1234567) == "1,234,567"

# Note #1
# If it's too much, don't worry about handling negative numbers at first.

# Note #2
# As always, focus first on how you would do this *as a human*. Imagine you
# has a piece of paper with a comma-less number on it.  How would you decide to
# insert the commas?  Which comma would you insert first?

def commas(n)
  str = n.to_s
  return str if str.length <= 3
  commas(str[0...-3].to_i) + "," + str[-3..]
end

puts commas(123)     # == "123"
puts commas(1234)    # == "1,234"
puts commas(12345)   # == "12,345"
puts commas(1234567) # "1,234,567"
puts commas(-1234567)     # "-1,234,567"
