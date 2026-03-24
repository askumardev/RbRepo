def palindrome_check(input)
  arr = []
  rev = []
  str = ""
  if input.is_a?(String)
    arr = input.chars
  else
    str = input.to_s
    arr = str.chars
  end
  #p arr
  rev << arr.pop until arr.empty?
  p rev.join == input if input.is_a?(String)
  p rev.join.to_i == input if input.is_a?(Integer)
  
  #== str
end

palindrome_check("12231")
palindrome_check(121)
palindrome_check("malayalam")
palindrome_check(124)