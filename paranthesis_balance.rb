require 'pry'
def check_balanced_parentheses?(entered_string)
  stack = []
  entered_string.chars.each do |token|
    case token
      when '('
        stack.push '('
      when ')'
        if stack.empty? || stack.pop != '('
          return 0
        end
    end
  end
  if stack.empty?
      return 1
  end
end

puts "Enter string :"
entered_string = gets
puts check_balanced_parentheses?(entered_string)