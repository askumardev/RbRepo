# The Exception Tree
# Since Ruby's exceptions are implemented in a class heirarchy, it can be helpful to see it laid out. 
# Below is a list of exception classes that ship with Ruby's standard library. 
# Third-party gems like rails will add additional exception classes to this chart, but they will all inherit from some class on this list.

Exception
 NoMemoryError
 ScriptError
   LoadError
   NotImplementedError
   SyntaxError
 SignalException
   Interrupt
 StandardError
   ArgumentError
   IOError
     EOFError
   IndexError
   LocalJumpError
   NameError
     NoMethodError
   RangeError
     FloatDomainError
   RegexpError
   RuntimeError
   SecurityError
   SystemCallError
   SystemStackError
   ThreadError
   TypeError
   ZeroDivisionError
 SystemExit
 fatal
