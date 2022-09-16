#array uniq without uniq

require 'set'

arr = [1,2,2,3,3,3,4,4,4,4,4,4,5]
p Set.new(arr).to_a

# ruby interview/arr_uniq.rb