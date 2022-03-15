s="hello patrick this is patrick"
s['patrick'] = "satish"
p s
#================================>
# "Hellooo" => "Helo" using each
str = "Hellooo"
res = ""
str.chars.each do |s|
  res += s if res.chars.last != s
end
p res

#========Alt way using map===================>
res1 = ""
str.chars.map{|s| res1 += s unless res1.chars.last == s }
p res1

#***Alt way using next***
arr = str.chars
new = []
arr.each_with_index do |x,i|
  next if new.last == x
  new << x
end
p new.join("")