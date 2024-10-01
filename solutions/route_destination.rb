# ruby solutions/route_destination.rb

def find_route(route, target_destination)
  destinations = route.split("=>")#.map(&:strip)
  p destinations

  if destinations.include?(target_destination)
    index = destinations.index(target_destination)
    route_from_destination = destinations[index..].join("=>")
    return route_from_destination
  else
    return "No route available to #{target_destination}"
  end
end

# Given route string
route_source = "mumbai=>delhi=>goa=>bangalore=>chennai"

# Specify the target destination
target_destination = "delhi"

# Find the route from the specified destination
result = find_route(route_source, target_destination)

# Print the result
puts result



# def find_route(route, target_destination)
#   # Split the route string into destinations
#   destinations = route.split("=>").map(&:strip).reject(&:empty?)

#   # Check if the target destination is in the route
#   if destinations.include?(target_destination)
#     # Find the index of the target destination
#     index = destinations.index(target_destination)

#     # Extract the route starting from the target destination
#     route_from_destination = destinations[index..].join("=>")

#     return route_from_destination
#   else
#     return "No route available to #{target_destination}"
#   end
# end

# # Given route string
# route_source = "mumbai=>delhi=>goa=>bangalore=>chennai"

# # Specify the target destination
# target_destination = "bangalore"

# # Find the route from the specified destination
# result = find_route(route_source, target_destination)

# # Print the result
# puts result