# ruby interview/altimetrik.rb

def is_palin(x)
  rev = 0
  num = x
  return false if num < 0
  while num != 0
    ex = num % 10 # Extract the last digit
    # p ex
    rev = rev * 10 + ex # Append the digit to rev
    # p rev
    num = num / 10 # Remove the last digit from num
    # p num
  end
  if rev != x
    false
  else
    true
  end
end

p is_palin(-11) # should return false
p is_palin(1234) # should return false
p is_palin(1221) # should return true