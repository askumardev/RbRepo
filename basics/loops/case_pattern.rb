users = [
 {name: "Alice", age:30 },
 {name: "Bob", age:18 },
 {name: "Clive", age:35 },
 {name: "David", age:16 },
 {name: "Alice", age:20 },
 {name: "Eve", age:40 }
]

users.each do |user|
 case user
 in { name:name, age: 0..17 }
  puts "#{name} is teen"
 in { name:name, age: 18..25 }
  puts "#{name} is young"
 in { name:name, age: 26..35 }
  puts "#{name} is in mid 30s"
 else
  puts "#{name} is not categorized"
 end
end

# ruby basics/loops/case_pattern.rb