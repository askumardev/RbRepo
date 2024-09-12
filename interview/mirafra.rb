# ruby interview/mirafra.rb

str = "satish".freeze

p str.dup.frozen? #false
p str.clone.frozen? #true

obj = Object.new
def obj.hello
  "hello..."
end

p obj.hello
# p obj.dup.hello     #undefined method `hello' for an instance of Object (NoMethodError)
p obj.clone.hello

# clone copies any singleton methods that were defined for a specific object.
# dup does not copy singleton methods, meaning the new object won't have access to them.
