# ruby interview/altimetrik.rb

def is_palin(x)
  rev = 0
  num = x
  return false if num < 0
  while num != 0
    ex = num%10
    #p ex
    rev = rev*10 + ex
    #p rev
    num = num/10
    #p num
  end
  if rev != x
    false
  else
    true
  end
end

p is_palin(1234)
p is_palin(1221)
#p is_palin(-123)
