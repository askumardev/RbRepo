# ruby hackerRank/addition.rb

# Complete the function solveMeFirst to compute the sum of two integers.
# Example
# a = 7, b = 3
# Return 10
# Constraints 1 <= a, b <= 1000

def solveMeFirst (a, b)
  if a >= 1 && b <= 1000
    a + b
  else
    puts "a is either zero or positive"
  end
end

puts solveMeFirst(7,3)
puts solveMeFirst(0,3)
puts solveMeFirst(-7,3)
