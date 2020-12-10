p = Proc.new do |a|
    puts "This is #{a}"
end
p.call(10)
p.(20)
p[30]
p === 40