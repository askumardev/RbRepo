# Finding the available destinations from given route source
# routes "mumbai=>delhi=>goa=>bangalore=>chennai"
# i/p: chennai
# o/p: no routes available
# i/p: delhi
# o/p: delhi=>goa=>bangalore=>chennai

routes = 'mumbai=>delhi=>goa=>bangalore=>chennai'.gsub('=>', ',').split(',')
result = []
puts "#{routes.inspect}"
puts "enter route::"
inp = gets.chomp.to_s
abort('no routes available/ mismatched route') if !routes.include?(inp)
src = routes.find_index(inp)
dest = routes.find_index("chennai")
(src..dest).each do |x|
  result << routes.values_at(x)
end
p result.flatten.join(",").gsub(",","=>")

# routes = 'mumbai=>delhi=>goa=>bangalore=>chennai'.gsub!('=>', ',').split(',')
# ind = nil
# puts "#{routes.inspect}"
# puts "enter route::"
# inp = gets.chomp.to_s
# abort('no routes available/ mismatched route') if !routes.include?(inp)
# routes.each_with_index.map { |x,i| ind = i if routes[i] == inp }
# res_arr = []
# if routes[ind] && routes[ind + 1]
#   routes.each_with_index.map { |x,i| res_arr << routes[i] if  i <= ind }
#   puts res_arr.join('=>')
# else
#   puts 'no routes available'
# end