# ruby basics/loops/patterns.rb
puts ("-----Pattern 1-------")
print "Enter Number for Rows", ": "
rows = gets.chomp.to_i
for row in 0..rows
  (rows-row).times {print " "}
  row.times {print "*"}
  puts
end
puts ("-----Pattern 2-------")
print "Enter Number for Rows", ": "
rows = gets.chomp.to_i
for row in 0..rows
  row.times {print "*"}
  (rows-row).times {print " "}
  puts
end
puts ("-----Pattern 3-------")
print "Enter Number for Rows", ": "
rows = gets.chomp.to_i
for row in 0..rows
  (rows-row).times {print "*"}
  puts
end
puts ("-----Pattern 4-------")
print "Enter Number for Rows", ": "
rows = gets.chomp.to_i
for row in 0..rows
  row.times {print " "} 
  (rows-row).times {print "*"}
  puts
end
puts ("-----Pattern 5-------")
print "Enter Number for Rows", ": "
rows = gets.chomp.to_i
for row in 0..rows
  (rows-row).times {print " "}
  row.times {print "*"}
  (row-1).times {print "*" }
  puts
end
puts ("-----Pattern 6-------")
print "Enter Number for Rows", ": "
rows = gets.chomp.to_i
for row in 0..rows
  row.times {print " "}
  (rows-row).times {print "*"}  
  (rows-row-1).times {print "*" }
  puts
end
puts ("-----Pattern 7-------")
rows = gets.chomp.to_i
for row in 0..rows
  (rows-row).times {print " "}
  row.times {print "*"}
  (row-1).times {print "*" }
  puts
end
for row in 0..rows
  row.times {print " "}
  (rows-row).times {print "*" }
  (rows-row-1).times {print "*"}
  puts
end