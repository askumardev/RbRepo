# ruby interview/encora.rb

str ="A man, a plan, a canal, Panama"
str = str.gsub(",","").gsub(" ","").downcase
p str
rev =[]
arr = str.chars
p arr
rev << arr.pop until arr.empty?
p rev
new_str = rev.join("").gsub(",","").gsub(" ","").downcase
p new_str
 p str == new_str
 p "------------------------------------------"

module Swimmer
  def swim
    puts "I can swim!"
  end
end

class Abc
  include Swimmer
end

class A
  extend Swimmer
end

a = Abc.new.swim
A.swim

hsh = {x: 1, y: nil, z: 3}
p hsh.select { |k, v| !v.nil? }

p "satish".object_id

# Employee.order(salary: :desc).offset(1)
# Employee.order(salary: :desc).limit(2).last

#ducktyping