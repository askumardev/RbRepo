str = "ggggggggggrrrrrrrrrrrrreeeeeeeeeeeeeeeeeaaaaaaaaaaaaaaaattttttttttttttttttttttttttttt"
arr = str.chars

hsh = arr.map{|x| [x,arr.count(x)]}.to_h
puts hsh
puts "***********"
hsh1 = arr.group_by(&:itself).transform_values(&:count)
puts hsh1