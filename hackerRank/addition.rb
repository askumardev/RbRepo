# ruby hackerRank/addition.rb


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
