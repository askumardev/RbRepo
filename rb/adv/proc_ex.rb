# ruby adv/proc_ex.rb

def run_procs(a, b)
  a.call
  b.call
end
p1 = proc do
  puts 'Proc1'
end

p2 = proc do
  puts 'Proc2'
end
run_procs(p1, p2)
