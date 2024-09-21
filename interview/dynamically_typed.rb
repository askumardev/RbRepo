# In a dynamically typed language like Ruby:

# Type checking happens at runtime, not at compile-time.
# Variables do not have a fixed type. You can assign any type of object to a variable, and
#   Ruby determines the type when the code is executed.

x = 10        # x is an Integer
x = "hello"   # Now x is a String

# In the example above, x changes its type from an Integer to a String without any issues because
# Ruby evaluates the type when the assignment happens during runtime.

# This is in contrast to statically typed languages (like Java or C++), where the type of a variable must be
# declared explicitly and enforced at compile-time.

# Key Characteristics of Ruby’s Dynamic Typing:
# No type declarations: You don’t need to declare the type of a variable.
# Duck typing: Ruby focuses on whether an object can respond to a method (its behavior), rather than strictly what type it is.
# Flexibility: You can pass around objects of different types without needing to specify types explicitly, making Ruby very flexible.

# However, dynamic typing also means that type-related errors can only be detected when the code is running,
# rather than before execution, which can lead to runtime errors.
