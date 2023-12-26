str = "ggggggggggrrrrrrrrrrrrreeeeeeeeeeeeeeeeeaaaaaaaaaaaaaaaattttttttttttttttttttttttttttt"
arr = str.chars

hsh = arr.map{|x| [x,arr.count(x)]}.to_h
puts hsh
puts "***********"


#Alternate way
hsh1 = arr.group_by(&:itself).transform_values(&:count)
puts hsh1

#o/p:
# {"g"=>10, "r"=>13, "e"=>17, "a"=>16, "t"=>29}
# ***********
# {"g"=>10, "r"=>13, "e"=>17, "a"=>16, "t"=>29}

# ruby interview/great_count.rb