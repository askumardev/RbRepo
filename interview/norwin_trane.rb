# ruby interview/norwin_trane.rb

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


-------------------------------------------

request response cycle

inheritance

how to accessa class method from another class without inheritance

mvc -> model

what is dsa

any sort program

input: [1,2,3,4,5,6,7,8,9,10]
o/p: [10,1,9,2,8,3,7,4,6,5]
