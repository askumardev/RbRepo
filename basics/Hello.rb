# ruby ds/basics/Hello.rb

# This is a single line comment.

=begin
This is a 
multiline comment.
=end

puts 'Hello, World!'

# simple
puts 'hello'
world = ' world!..'
puts world
#-------------------------------

# using method
def hello
  puts 'hello satish'
end
hello
#----------------------------------
# using arguments
def hello(any_thing)
  puts any_thing
end

hello 'satish... '
hello 'satish... ur learning ruby!! '
hello(123)