# ruby basics/args.rb

def sample(title:, lang: 'Eng')
  puts title
  puts lang
end
sample lang: 'FR', title: 'Lord of rings'
#------------------------------------

def showname
  return "Satish"
end
  
puts "Hello #{showname}"
puts( "\n\t#{(1+2) * 3}\nGoodbye" )

# following  method holds default paramerer
def say(words='hello')
  puts words + '.'
end

say()
say('hi')
