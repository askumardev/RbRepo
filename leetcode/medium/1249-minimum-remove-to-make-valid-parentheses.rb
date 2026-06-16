# ruby leetcode/medium/1249-minimum-remove-to-make-valid-parentheses.rb

# Given a string s of '(' , ')' and lowercase English characters.

# Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

# Formally, a parentheses string is valid if and only if:

# It is the empty string, contains only lowercase characters, or
# It can be written as AB (A concatenated with B), where A and B are valid strings, or
# It can be written as (A), where A is a valid string.


# Example 1:

# Input: s = "lee(t(c)o)de)"
# Output: "lee(t(c)o)de"
# Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
# Example 2:

# Input: s = "a)b(c)d"
# Output: "ab(c)d"
# Example 3:

# Input: s = "))(("
# Output: ""
# Explanation: An empty string is also valid.


# Constraints:

# 1 <= s.length <= 105
# s[i] is either '(' , ')', or lowercase English letter.


# @param {String} s
# @return {String}

PARENS = {
  "(" => ")",
  "{" => "}",
  "[" => "]"
}

OPENING = PARENS.keys
CLOSING = PARENS.values

def min_remove_to_make_valid(str)
  stack = []          # stores [char, index]
  remove_indices = []

  str.each_char.with_index do |ch, i|
    if OPENING.include?(ch)
      stack << [ch, i]

    elsif CLOSING.include?(ch)
      if !stack.empty? && PARENS[stack.last[0]] == ch
        stack.pop
      else
        remove_indices << i
      end
    end
  end

  # Unmatched opening brackets
  stack.each do |_, index|
    remove_indices << index
  end

  remove_set = remove_indices.to_h { |i| [i, true] }

  result = ""

  str.each_char.with_index do |ch, i|
    result << ch unless remove_set[i]
  end

  result
end

puts min_remove_to_make_valid("lee(t)c{od}}[e]")    # lee(t)c{od}[e]
puts min_remove_to_make_valid("lee(tc{od}}[e]")     # leetc{od}[e]
puts min_remove_to_make_valid("lee(tc{od}}]}[e]")   #
