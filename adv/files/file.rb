# ruby adv/files/file.rb

file = File.open("rough.txt")

file_data = file.read
file_data = file.readlines.map(&:chomp)
File.foreach("rough.txt") { |line| puts line }
file.close


File.open("log.txt", "w") { |f| f.write "#{Time.now} - User logged in\n" }