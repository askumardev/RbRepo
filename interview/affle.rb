# ruby interview/affle.rb

#camping leetcode-1190

def reverse_in_parentheses(s)
  stack = []
  result = ''

  s.each_char do |char|
    if char == '('
      stack.push(result)
      result = ''
    elsif char == ')'
      result = stack.pop + result.reverse
    else
      result += char
    end
  end

  result
end

# Example usage:
input_string = "a(bc)de(fg)h"
p reverse_in_parentheses(input_string)
input_string = "(u(love)i)"
p reverse_in_parentheses(input_string)



# output
# "acbdegfh"
# "iloveu"
