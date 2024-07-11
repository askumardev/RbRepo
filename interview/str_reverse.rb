#string reverse without string#reverse method
str = "satish"
arr = str.chars
rev = []
arr.size.times { rev << arr.pop}
p rev.join
p "---------------------------------"
def rev(str)
  arr = str.split
  rev = []
  p arr
  arr.size.times { rev << arr.pop}
  p rev.join(" ")
    
end
str = "satish kumar"
rev(str)


# ruby interview/str_reverse.rb