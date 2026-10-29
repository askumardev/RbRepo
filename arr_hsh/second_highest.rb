arr = [1,2,3,4,2,3,3,4]
hsh = arr.tally
p hsh
second_highest = h.values.uniq.max(2).last
p second_highest
# p hsh.select{|k,v| v > 1}.keys # duplicate numbers
p hsh.select{|k,v| v == second_highest}.keys


# ruby arr_hsh/second_highest.rb
