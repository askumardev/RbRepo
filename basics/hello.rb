# frozen_string_literal: true

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
