# ruby interview/incubyte.rb

# class Addition
#   def add(str)
#     arr = str.split(/,|\n/).map { |x| x.to_i }
#     return 0 if str.empty? && arr.size == 0
#     return 1 if str == "1" && arr.size == 1
#     negative = arr.select { |x| x.negative? }
#     unless negative.empty?
#       return "negative numbers not allowed"
#     else
#       if arr.size > 1
#         return arr.inject(0) { |sum, x| sum + x }
#       end
#     end
#   end
# end

p "-------Refactord code below------------"
class Addition
  def add(str)
    return 0 if str.empty?

    arr = str.split(/,|\n/).map(&:to_i)
    negative_numbers = arr.select(&:negative?)

    return "negative numbers not allowed" unless negative_numbers.empty?
    arr.sum
  end
end

a = Addition.new
p a.add("")
p a.add("1")
p a.add("1,5")
p a.add("1,-1,5")
p a.add("1,1,5")
p a.add("1,1,5,3")
p a.add("1,1,5,\n4")