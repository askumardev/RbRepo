#array uniq without uniq

require 'set'

arr = [1,2,2,3,3,3,4,4,4,4,4,4,5]
p Set.new(arr).to_a


# require 'set'

# def remove_duplicates(array)
#   set = Set.new
#   array.each do |element|
#     set.add(element)
#   end
#   set.to_a
# end

# # Example usage
# arr = [1, 2, 2, 3, 4, 4, 5]
# puts remove_duplicates(arr).inspect
# # Output: [1, 2, 3, 4, 5]

# ruby interview/arr_uniq_set.rb