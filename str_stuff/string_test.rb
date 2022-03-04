# frozen_string_literal: true

# puts 'satish'
# puts 'kumar'

# #---------------
# puts 'satishkumar'
# name = 'satish'
# puts "my name is: #{name}"

s1 = 'abc'.chars
s2 = 'def'.chars
new = []

siz = s1.length + s2.length
x = 0
siz.times do |i|
  new << s1[i]
  new << s2[i]
  i += 1
  break if new.size == 6
end

puts new.join
#######################################################
def front_back(txt)
  txt[-1] << txt[1...-1] << txt[0]
  puts txt[0]
  puts txt[1..-1]
  puts txt[-1]
  txt[-1] << txt[1...-1] << txt[0]
end
print front_back('Python'), "\n"
print front_back('Java'), "\n"
