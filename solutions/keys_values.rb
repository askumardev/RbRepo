x = [{"a" => 10},{"b" => 20},{"c" => 30}]
y = x[0].merge(x[1])#.merge(x[2])
puts y.keys
puts y.values