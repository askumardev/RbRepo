# arr = [1,2,3,4,2,3,3,4]
# hsh = arr.tally
# p hsh
# second_highest = hsh.values.uniq.max(2).last
# p second_highest
# # p hsh.select{|k,v| v > 1}.keys # duplicate numbers
# p hsh.select{|k,v| v == second_highest}.keys


arr = [1, 2, 3, 4, 2, 3, 3, 4]

hsh = arr.tally

highest = 0
second_highest = 0

hsh.each do |key, count|
  if count > highest
    second_highest = highest
    highest = count
  elsif count > second_highest && count < highest
    second_highest = count
  end
end

# p second_highest
# 2

hsh.each do |key, count|
  puts key if count == second_highest
end

# 2
# 4

# ruby arr_hsh/second_highest.rb
