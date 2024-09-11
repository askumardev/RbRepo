# ruby adv/splatter.rb

prime = [3,5,7]

arr = [1,2,*prime,4]
p arr

def dubSplat(a, *b, **c)
  p a
  p b
  p c
end
dubSplat(1,2,3, 4, a: 40, b: 50)

# def meth *players
# 	puts players
# 	p players
# end
# meth "sachin","kohli","saina"
###############
# def meth **players_pos
# 	players_pos.each do |player,pos|
# 		puts "Player: #{player}"
# 		puts "Position: #{pos}"
# 	end
# end
# data = {
# 	"Sachin": "2",
# 	"Kohli": "3",
# 	"Dhoni": 4
# }
# meth data
############################################
