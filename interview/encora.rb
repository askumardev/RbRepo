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

----------------------------------------

def anagrams?(str1, str2)
  # Remove spaces and convert to lowercase for accurate comparison
  str1 = str1.gsub(/\s+/, "").downcase
  str2 = str2.gsub(/\s+/, "").downcase

  # Sort the characters of both strings
  str1.chars.sort == str2.chars.sort
end

# Example usage
string1 = "Clint Eastwood"
string2 = "Old West Action"

if anagrams?(string1, string2)
  puts "\"#{string1}\" and \"#{string2}\" are anagrams."
else
  puts "\"#{string1}\" and \"#{string2}\" are not anagrams."
end

check_anagram(string1, string2) # returns true

[3:40 PM] Abhinav Nain
- expect("").to be_falsey
- expect("").to be false
- expect(false).to be_falsey
- expect(false).to be false
[3:41 PM] Abhinav Nain
- nil.present?
- nil.empty?
- nil.blank?
- false.present?
- false.blank?
