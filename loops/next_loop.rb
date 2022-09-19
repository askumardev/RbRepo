# ruby loops/next_loop.rb

i = 0
loop do
  i = i + 2
  if i == 4
    next # skips rest of the code in this iteration
  end
  puts i
  if i == 10
    break
  end
end