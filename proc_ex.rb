def run_procs(a,b)
    a.call
    b.call
end
p1=Proc.new do
    puts "Proc1"
end

p2=Proc.new do
    puts "Proc2"
end
run_procs(p1,p2)