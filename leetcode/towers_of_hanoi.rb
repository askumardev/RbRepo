def toh(n, from, aux, to)
  if n > 0
    toh(n-1, from, to, aux)
    puts "Move disk #{n} from #{from} to #{to}"
    toh(n-1, aux, from, to)
  end
end


n = 3
toh(n, 'A', 'B', 'C')

# ruby leetcode/towers_of_hanoi.rb
