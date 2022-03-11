# def arr_flatten(arr)
#   result = []
#   arr.each do |e|
#     if e.class == Array
#       e.each {|v| result << v}
#     else
#       result << e
#     end
#   end
#   result
# end
array = [1,2,3,4,[5,6,[7,7,8]]]
# p arr_flatten(array)

p array.to_s.gsub("[","").gsub("]","").split.map{|x| x.to_i}