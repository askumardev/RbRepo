def is_palindrome(x)
  orig = x

  sum = 0
  while x > 0
    x, rem = x.divmod(10)
    sum = sum * 10 + rem
    #puts sum
  end
  x = (sum == orig)
  puts x
end

is_palindrome(121)