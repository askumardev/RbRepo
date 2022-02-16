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
    if OPENING_PARENS.include?(ch)
      stack << ch
    elsif CLOSING_PARENS.include?(ch)
      ch == PARENS[stack.last] ? stack.pop : (return false)
    end
  end

  stack.empty?
end

p valid_parentheses("(){}[]") # true
p valid_parentheses("[(])")   # false