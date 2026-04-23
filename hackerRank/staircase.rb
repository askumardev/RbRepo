def staircase(n)
  (1..n).each do |i|
    puts (" " * (n - i)) + ("#" * i)
  end
end

staircase(n)

# ruby hackerRank/staircase.rb
