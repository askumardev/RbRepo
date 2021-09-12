# frozen_string_literal: true

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
def invoice(options = {})
  puts options[:company]
  puts options[:total]
  puts options[:state]
  puts options[:country]
end

invoice company: 'Google', total: 100, state: 'Hyd'
