# ruby basics/String/format_string.rb

# If a string is having any "%" prefixed literals in it, they are called as "format sequences", and that string is a format specification string.
# "str is %[flags][width][.precision]type"

# The syntax of a format sequence is as follows.
# %[flags][width][.precision]type
# A format sequence consists of a percent sign, followed by optional flags, width, and precision indicators, then terminated with a field type character. The field type controls how the corresponding sprintf argument is to be interpreted, while the flags modify that interpretation.

# The field type characters can be of
# 1) Integer Format
# 2) Float Format
# 3) Other Format

# String#str % arg → new_str
# Kernel#sprintf(format_string [, arguments...] ) → string
#
# Returns the string resulting from applying format_string to any additional arguments. Within the format string, any characters other than format sequences are copied to the result.

# %b => Convert argument as a binary number.
"%b" % 2 # => "10"
sprintf("%b", 2) # => "10"

# %o => Convert argument as an octal number.
"%o" % 10 # => "12"

# %x => Convert argument as a hexadecimal number.
"%x" % 10 # => "a"
#
# Equivalent to `x', but uses uppercase letters.
"%X" % 10 # => "A"
#
# %d, %i, %u => Convert argument as a decimal number.
"%d" % 10.5 # => "10"
#
# %p => The valuing of argument.inspect.
nil.inspect # => "nil"
"%p" % nil # => "nil"

# %s => Argument is a string to be substituted.
"foo %s" % "bar" # => "foo bar"

# If the arguments is an array
"%s %s %s" % [100, 200, 300] # => "100 200 300"

# If the arguments is a hash
format_specification_str = ":foo is %{foo}, :bar is %{bar}, :baz is %{baz}"
args = { foo: 100, bar: 200, baz: 300 }
#
format_specification_str % args # => ":foo is 100, :bar is 200, :baz is 300"
sprintf(format_specification_str, args) # => ":foo is 100, :bar is 200, :baz is 300"




