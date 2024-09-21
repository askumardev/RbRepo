# Every Ruby object has a singleton class (also known as an eigenclass) that is used to hold methods defined for that particular object. 
# You can think of it as a class that’s unique to a single instance.


obj = "hello"

# Define a singleton method using the singleton class
class << obj
  def shout
    "HELLO1 FROM THE SINGLETON CLASS!"
  end
  def shout2
    "HELLO2 FROM THE SINGLETON CLASS!"
  end
end

# Call the singleton method
puts obj.shout  # Output: HELLO FROM THE SINGLETON CLASS!
puts obj.shout2