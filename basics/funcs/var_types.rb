# ruby basics/var_types.rb

=begin
  Local variables : A local variable name starts with a lower case or underscore(_).
                    It is only accessible or have its scope within the block of its initialization.
                    Once code blocl completes, varible has no scope

  Class variables : A class variable name starts with @@ sign.
                    A class variable belongs to whole class and can be accesible from anywhere inside the class.
                    If the value will be changed at one instance, it will be changed at every instance.
                    A class var is shared by all the descendents of the class.
                    An ininitialized class var will result in an error.

  Instance variables : An instance var starts with a @ sign
                       It belongs to one instance of the class and can be accessed from any instance of the class within a method.
                       They only have limited access to a particular instance of a class.
                       An uninitialized instance var will have a nil value

  Global variables : A global var starts with a $ sign.
                     Its scope is global, means it can be accessed from any where in a program.
                     An uninitialized global var will have a nil value
                     It is advised not to use them as they make the program cryptic and complex
=end

CONST = 100
localvar = "hello"
$globalvar = "goodbye" 

def amethod
  localvar = 10
  puts "CONST val = #{CONST}"
  puts "local var = #{localvar}"
  puts "global var = #{$globalvar}"
end

def anotherMethod
  localvar = 500
  $globalvar = "bonjour"
  puts( localvar )
  puts( $globalvar )
end

amethod
puts
anotherMethod
puts
amethod
puts
puts( localvar )
puts( $globalvar )

class Customer
  @@state = "AP"
  def initialize(name)
    @name = name
  end
  def display
    puts "Customer name is #{@name} and belongs to #{@@state}"
    puts "global var from class method = #{$globalvar}"
  end
end

customer1 = Customer.new("Satish")
customer1.display
