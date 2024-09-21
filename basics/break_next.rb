break_arr = []
next_arr = []

for i in 1..10
  if i == 5
    break
  end
  break_arr << i
end
p break_arr #[1, 2, 3, 4]

for i in 1..10
  if i == 7
    next
  end
  next_arr << i
end
p next_arr #[1, 2, 3, 4, 5, 6, 8, 9, 10] --- skips the loop when i == 7

# ruby basics/break_next.rb