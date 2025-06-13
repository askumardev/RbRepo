# ruby cop/count_lines.rb

def count_lines(filename)
  File.readlines(filename).size
end

puts "Number of lines: #{count_lines('rough.txt')}"
