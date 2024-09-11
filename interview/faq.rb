# ruby interview/faq.rb

user={name: "satish", fav: {food:"Pizza",movie:"Batman"}}
p user.dig(:fav,:food)
p "-------------------------------------------------------"
str = "gggrrrrrrrrrreeeeeeeeeaaaaaaaaaaaaatttttt"
arr = str.chars
hsh = arr.map{|x| [x, arr.count(x)]}.to_h
p hsh
value, count = hsh.max_by{|_,count| count}
p [value, count]
p "-------------------------------------------------------"
arr = [1,2,3,4]
new = []
p arr
new = arr.map{ |x| x*2}
p arr
p new
p "-------------------------------------------------------"
str = "satish kumar"
arr = str.chars
rev = []
arr.size.times { rev << arr.pop}
p rev.join
p "-------------------------------------------------------"
def rev(str)
  arr = str.split
  rev = []
  p arr
  arr.size.times { rev << arr.pop}
  p rev.join(" ")
end
str = "satish kumar"
rev(str)
p "-------------------------------------------------------"
array = [1,2,3,4,[5,6,[7,7,8]]]
p array.to_s.gsub("[","").gsub("]","").split.map{|x| x.to_i}
p "-------------------------------------------------------"
def flat_arr(array, result=[])
  array.each do |element|
    if element.is_a?(Array)
      flat_arr(element, result)
    else
      result << element
    end
  end
  result
end
p flat_arr(array)
p "-------------------------------------------------------"
str = "hi patrick this is patrick"
arr = str.split
p arr
p arr.map{|x| x=="patrick" ? "satish" : x}.join(" ")
p "-------------------------------------------------------"
class Array
  def mul10
    map{|x| x*10}
  end
  def div2
    map{|x| x/2}
  end
end
arr=[1,2,3,4]
p arr.mul10.div2
