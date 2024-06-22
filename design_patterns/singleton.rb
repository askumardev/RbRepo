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
end

singleton = SingletonExample.instance
puts singleton.display_message

# ruby design_patterns/singleton.rb