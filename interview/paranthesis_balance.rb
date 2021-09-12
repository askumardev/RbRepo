# frozen_string_literal: true

require 'pry'
def check_balanced_parentheses?(entered_string)
  stack = []
  entered_string.chars.each do |token|
    case token
    when '('
      stack.push '('
    when ')'
      return 0 if stack.empty? || stack.pop != '('
    end
  end
  return 1 if stack.empty?
end

puts 'Enter string :'
entered_string = gets
puts check_balanced_parentheses?(entered_string)

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
