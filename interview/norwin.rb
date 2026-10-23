super
types of inheritence
modules
scopes
meta programming
orm
monkey patching
design pattern
singleton class



arr = [1,1,2,3,1,2,4,4,4,4,5,5,5,5]

hsh = arr.tally
max_count = hsh.values.max

most_frequent = hsh.select { |key, count| count == max_count }.keys

p most_frequent
# [4, 5]

# ruby interview/norwin.rb
