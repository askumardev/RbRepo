#string reverse without string#reverse method
def rev_string(str)
  arr = str.split("")
  p arr
  rev = []
  str.size.times { rev << arr.pop }
  rev.join
end

p rev_string("satish")