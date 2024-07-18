require 'pry'
class Addition
  def add(str)
    return 0 if str.empty?
    str = str.gsub("\\n", "\n")
    arr = str.split(/,|\n/).map(&:to_i)
    #binding.pry
    negative = arr.select(&:negative?)
    return "negative numbers not allowed" unless negative.empty?

    arr.sum
  end
end

a = Addition.new
p a.add("") # 0
p a.add("1") # 1
p a.add("1,5") #
p a.add("1,-1,5") # "negative numbers not allowed"
p a.add("1,1,5") # 7
p a.add("1,1,5,3") # 10
p a.add("1,1,\n4,3") # 9
p a.add("1,1,4\n,3") # 9
