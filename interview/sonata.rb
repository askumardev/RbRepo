
params['Action'] = input['Action'] unless input['Action'].nil?
---------------------------------
["1","2","3"]
[[l, "1"],[l,"2"],[l,"3"]]
result.sort_by { |v| v[:name] }.map { |k| [k[:name].labelize, k[:name]] }


getArray: lambda do |_a,b|
end

parameters&.map do |parameter|
end


x = "#{a}#{b}"
p x
--------------------------------------------
a ||= b
# The expression a ||= b in Ruby is a shorthand for:
# a = a || b

# Explanation:
# ||= is known as a conditional assignment operator.
# It assigns the value of b to a only if a is nil or false.
# If a already has a truthy value (anything that isn't nil or false),
# it remains unchanged.
-----------------------------------------------

hsh = [
  { "a" => 1, "b" => 2 },
  { "a" => 3, "b" => 4 }
]

arr = []
hsh.each do |hash|
  arr << hash["b"] # Access the value associated with key "b" in each hash
end

p arr  # Output: [2, 4]
