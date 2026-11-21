# ruby adv/proc_ex2.rb

p = proc do |a|
  puts "This is #{a}"
end
p.call(10)
p.call(20)
p[30]
p === 40
