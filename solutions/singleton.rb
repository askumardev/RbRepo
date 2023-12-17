# A singleton pattern is a design pattern that restricts the instantiation of a class to only one instance. 
# This is useful when you need a single object to coordinate actions across the system. 
# In Ruby, you can implement a singleton pattern using the Singleton module from the Ruby Standard Library.

require 'singleton'

class Logger
  include Singleton

  def log(message)
    puts "[LOG] #{message}"
  end
end

logger1 = Logger.instance
logger2 = Logger.instance

logger1.log("Hello, World!")
logger2.log("Hello, again!")

puts "logger1 and logger2 are the same object: #{logger1 == logger2}"


# In this example, we include the Singleton module in the Logger class. This ensures that there can only be one instance of the Logger class. 
# The instance method is used to get the singleton instance of the class. When we compare logger1 and logger2, they are the same object.