# ruby interview/valid_peranthesis.rb

# require 'pry'
PARENS = {
  "(" => ")",
  "{" => "}",
  "[" => "]"
}

OPENING_PARENS = PARENS.keys
CLOSING_PARENS = PARENS.values

def valid_parentheses(string)
  stack  = []

  string.each_char do |ch|
    p ch
    if OPENING_PARENS.include?(ch)
      stack << ch
    elsif CLOSING_PARENS.include?(ch)
      p "----#{stack}----"
      ch == PARENS[stack.last] ? stack.pop : (return false)
    end
  end
  p stack
  stack.empty?
end
p "-------------------------------------"
p valid_parentheses("(){}[]") # true
p "-------------------------------------"
p valid_parentheses("[(])")   # false
p "-------------------------------------"
p valid_parentheses("1 + (4 + 6 * 2") #false
p "-------------------------------------"
p valid_parentheses("({}[])") # true
p "-------------------------------------"
p valid_parentheses("{}([])") # true
p "-------------------------------------"
p valid_parentheses("{(}[])") # false
p "-------------------------------------"
