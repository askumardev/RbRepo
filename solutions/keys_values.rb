# ruby solutions/key_values.rb

x = [{"a" => 10},{"b" => 20},{"c" => 30}]
y = x[0].merge(x[1]).merge(x[2])
puts y
p "----keys----"
puts y.keys
p "----values----"
puts y.values