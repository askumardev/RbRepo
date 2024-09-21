# ruby basics/proc_lambda.rb

puts "*******Ruby Blocks******"
def print_once
  yield #When you use the yield keyword, the code inside the block will run & do its work
  yield
end
print_once { puts "Block is being run" }

def multiply_once
  yield 1
end
multiply_once { |number| puts number * 10 }

def explicit_block(&block)
  block.call # same as yield
end
explicit_block { puts "Explicit block called" }

def do_something_with_block
  return "No block given" unless block_given? # block_given? prevents the error if someone calls your method without a block.
  yield
end

puts "*******Ruby lambdas******"
say_something = -> { puts "This is a lambda" }
say_something.call
say_something = lambda { puts "This is also a lambda" }
say_something.call
#other ways of calling a lambda
puts "other ways of calling a lambda"
say = lambda { puts "Alternate ways of calling a lambda" }
say.()
say[]
say.===

#lambdas with arguments
puts "lambdas with arguments"
times_two = ->(x) { x * 2 }
p times_two.call(10)# 20
#p times_two.call(10,20) #wrong number of arguments (given 2, expected 1) (ArgumentError)

#Proc with arguments
puts "Proc with arguments"
times_two = Proc.new {|x| x * 2 }
p times_two.call(10)
p times_two.call(10,20)

#Proc vs lambda
my_proc = Proc.new { |x| puts x }
#There is no dedicated Lambda class. A lambda is just a special Proc object. 
#If you take a look at the instance methods from Proc, you will notice there is a lambda? method.

#return in proc and lambda
puts "******return in proc*******"
def proc_method
  puts "---before proc"
  my_proc = Proc.new do
    puts "proc1"
    return  # This will return from the entire method `proc_method`
    puts "proc2"
  end
  my_proc.call  # This line will never be executed
  puts "after proc"
end
proc_method

puts "******return in lambda*******"
def lambda_method
  puts "---before lambda"
  lmbd = lambda do
    puts "lambda1"
    return  # This only returns from the lambda block, not the method
    puts "lambda2"
  end
  lmbd.call
  puts "after lambda"  # This line will be executed
end
lambda_method

def method_proc
  thing  = Proc.new { return 1}
  thing.call
  return 2
end

def method_lambda
  thing1  = lambda { return 1}
  thing1.call
  return 2
end
puts "******=======method_proc=============****"
puts method_proc # => 1
puts "******=======method_lambda=============****"
puts method_lambda # => 2