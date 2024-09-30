----------------Round 1--------------------------
params['Action'] = input['Action'] unless input['Action'].nil?
---------------------------------
["1","2","3"]
[[l, "1"],[l,"2"],[l,"3"]]
result.sort_by { |v| v[:name] }.map { |k| [k[:name].labelize, k[:name]] }


getArray: lambda do |_a,b|
end

parameters&.map do |parameter|
end


x = "#{a}#{b}"
p x
--------------------------------------------
a ||= b
# The expression a ||= b in Ruby is a shorthand for:
# a = a || b

# Explanation:
# ||= is known as a conditional assignment operator.
# It assigns the value of b to a only if a is nil or false.
# If a already has a truthy value (anything that isn't nil or false),
# it remains unchanged.
-----------------------------------------------

hsh = [
  { "a" => 1, "b" => 2 },
  { "a" => 3, "b" => 4 }
]

arr = []
hsh.each do |hash|
  arr << hash["b"] # Access the value associated with key "b" in each hash
end

p arr  # Output: [2, 4]


--------------Round 2-------------------------------------
# add_error_handling: lambda do |request|
#       request.after_error_response(//) do |_code, body, _headers, message|
#         error_message = nil

#         if body&.match?(/\A\{/)
#           body = parse_json(body)

#           error_message = body['ErrorMessage']
#           error_message = [body.dig('error', 'message'), body.dig('error', 'innererror', 'message')].smart_join("\r\n") if error_message.blank?
#         else
#           error_message = body
#         end

#         error_message = message if error_message.blank?

#         error(error_message)
#       end
#     end,

def custom_sort(arr)
  # Your implementation here
  p arr.sort
 p arr.sort_by{|x| x.length}
end

puts custom_sort(["apple", "dog", "banana", "cat", "car"]).inspect
# Expected output: ["car", "cat", "dog", "apple", "banana"]
