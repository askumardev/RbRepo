# ruby arr_hsh/range_demo.rb

a = (1..5).to_a
p a

b = (1...5).to_a
p b

b = Array(1..10)
p b

c = (1..10).to_a
p c

odd = (1..10).step(2).to_a
p odd

even = 2.step(10, 2).to_a
p even