# ruby arr_hsh/array_methods_demo.rb

a = [1,2,2,3,4,5]
p a.uniq
p a
p a.uniq!
p a

b = Array(1..10)
p b

c = (1..10).to_a
p c

odd = (1..10).step(2).to_a
p odd

even = 2.step(10,2)
p even

sq = b.map{ |x| x*x }
p sq