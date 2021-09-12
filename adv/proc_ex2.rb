# frozen_string_literal: true

p = proc do |a|
  puts "This is #{a}"
end
p.call(10)
p.call(20)
p[30]
p === 40
