str = "ggggggggggrrrrrrrrrrrrreeeeeeeeeeeeeeeeeaaaaaaaaaaaaaaaattttttttttttttttttttttttttttt"
puts "*****using map******"
arr = str.chars
vowels = %w(a e i o u)
hsh = arr.map{|x| [x,arr.count(x)]}.to_h
vowels_arr = hsh.keys.select{|v| vowels.include?(v)}
p vowels_arr

conso_arr = hsh.keys.select{|v| !vowels.include?(v)}
p conso_arr

vowels_count = hsh.select{|k,v| vowels.include?(k)}
p vowels_count

puts "*****using tally******"
hsh = arr.tally
puts hsh

puts "--------------using Hash--------"
hsh = Hash.new(0)
arr.each { |x| hsh[x] += 1 }
puts hsh

puts "--------------using inject--------"
hsh = arr.inject(Hash.new(0)) { |h, x| h[x] += 1; h }
puts hsh

puts "****using group_by*******"
#Alternate way
hsh1 = arr.group_by(&:itself).transform_values(&:count)
puts hsh1

#o/p:
# {"g"=>10, "r"=>13, "e"=>17, "a"=>16, "t"=>29}
# ***********
# {"g"=>10, "r"=>13, "e"=>17, "a"=>16, "t"=>29}

# ruby interview/great_count.rb