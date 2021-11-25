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
  end
end

customer1 = Customer.new("satish")
customer1.display