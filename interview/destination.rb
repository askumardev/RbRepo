# ruby interview/destination.rb

# Finding the available destinations from given route source
# routes "mumbai=>delhi=>goa=>bangalore=>chennai"
# i/p: chennai
# o/p: no routes available
# i/p: delhi
# o/p: delhi=>goa=>bangalore=>chennai

routes = 'mumbai=>delhi=>goa=>bangalore=>chennai'.split('=>')
puts routes.inspect

puts "Enter route:"
inp = gets.chomp

unless routes.include?(inp)
  abort('No routes available or mismatched route')
end

index = routes.index(inp)
p index
res_arr = routes[index..-1]

if res_arr.size > 1
  puts res_arr.join('=>')
else
  puts 'No routes available'
end

#######################Alternate way below################################

# routes = 'mumbai=>delhi=>goa=>bangalore=>chennai'.gsub('=>', ',').split(',')
# result = []
# puts "#{routes.inspect}"
# puts "enter route::"
# inp = gets.chomp.to_s
# abort('no routes available/ mismatched route') if !routes.include?(inp)
# src = routes.find_index(inp)
# #dest = routes.find_index("chennai")
# dest = routes.index(routes.last)
# (src..dest).each do |x|
#   result << routes.values_at(x)
# end
# p result.flatten.join(",").gsub(",","=>")