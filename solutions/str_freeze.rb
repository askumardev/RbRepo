# ruby solutions/str_freeze.rb

# In Ruby, the frozen_string_literal magic comment is used to control the default string literal behavior in 
# a Ruby script or file. This magic comment was introduced in Ruby 2.3.0 to address the issue of mutable string literals.

# frozen_string_literal: true

str = "Hello, world!"
str[0] = "H"

puts str

STR = "abc".freeze
STR += "def"

puts STR

# greeting = "Hello, "
# name = "John"

# greeting.concat(name)   
# This will raise a RuntimeError: can't modify frozen String

# # In the above example, the frozen_string_literal: true comment ensures that the string literals in 
# that file are frozen by default.#  The str variable is assigned a string, and then the freeze method is called on it.
# # If you try to modify a frozen string, such as attempting to change a character at a specific 
# index (str[0] = "h"), Ruby will raise a RuntimeError.