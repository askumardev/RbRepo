# ruby basics/print.rb

# print : Displays object without new line. Allows you to print multiple times on the same line

# puts : Displays object and adds a new line at the end
#        puts attempts to convert everything into a string(by calling to_s)
#        puts always returns nil

# p : Displays objects for debugging. Raw version of the object. Linked to inspect method
#     returns the object you pass to it

# pp : Also called as pretty print
#      It prints big hashes and arays in a nicer way
#      prior to ruby2.5 we used to require 'pp' to get access to this method

data = [false, 42, %w{forty 2}, {:now => Time.now, :class => Time.now.class, :dist => 100}]
#---print---
print 'using print'
print 123
print 'abc'
print [1,nil,nil,4]

#---puts---
puts 'using puts'
puts 123
puts 'abc'
puts [1,nil,nil,4]

#---p---
p 'using p'
p 123
p 'abc'
p [1,nil,nil,4]

#---pp---
pp'using pp'
pp 123
pp 'abc'
pp [1,nil,nil,4]

#---with all---
print data
puts data
p data
pp data
