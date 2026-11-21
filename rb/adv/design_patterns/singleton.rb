# The Singleton pattern ensures a class has only one instance and provides a global point of access to it.

class SingletonExample
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def display_message
    "I am a Singleton!"
  end

  def display_some_message
    "I am a Singleton here...!"
  end
end

singleton = SingletonExample.instance
puts singleton.display_message
puts singleton.display_some_message

# ruby design_patterns/singleton.rb

# require 'singleton'

# class Shop
#   include Singleton
# end

# # Correct way to access the singleton instance
# shop1 = Shop.instance
# shop2 = Shop.instance

# puts shop1.object_id # Outputs the object ID of the singleton instance
# puts shop2.object_id # Outputs the same object ID, confirming both refer to the same instance
