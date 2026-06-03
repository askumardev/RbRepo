# ruby interview/paranthesis_balance.rb

# require 'pry'
def check_balanced_parentheses?(str)
  stack = []

  str.each_char do |char|
    if char == '('
      stack << char
    elsif char == ')'
      return false if stack.empty?
      stack.pop
    end
  end
  p stack
  stack.empty?
end

# puts 'Enter string :'
# entered_string = gets
p check_balanced_parentheses?("(())") # true
p check_balanced_parentheses?("(()")  # false
p check_balanced_parentheses?("())")  # false
p check_balanced_parentheses?("()()")
p check_balanced_parentheses?("((((")
#puts check_balanced_parentheses?(entered_string)

# require 'pry'
# def check_balanced_parentheses?(str)
#   stack = []
#   str.chars.each do |token|
#     case token
#       when '('
#         stack.push '('
#       when ')'
#         if stack.empty? || stack.pop != '('
#           return 0
#         end
#       when '['
#         stack.push '['
#       when ']'
#         if stack.empty? || stack.pop != '['
#           return 0
#         end
#       when '{'
#         stack.push '{'
#       when '}'
#         if stack.empty? || stack.pop != '{'
#           return 0
#         end
#     end
#   end
#   if stack.empty?
#       return 1
#   end
# end

# puts "Enter string :"
# entered_string = gets
# puts check_balanced_parentheses?(entered_string)
