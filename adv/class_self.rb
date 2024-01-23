class MyClass
  puts self       
  puts self.class
  p "--------------------------"
  def self.class_method
    puts "This is a class method"
  end

  obj = Object.new
  class << obj
    def helloooo
      puts "Helloooo!"
    end
  end
  obj.helloooo

  class << self
    def another_class_method
      puts "This is another class method"
    end

    def hello
      p "hello..."
    end
  end
end

# Calling class methods
MyClass.class_method      # Output: This is a class method
MyClass.another_class_method  # Output: This is another class method
MyClass.hello
puts self, self.class

# ruby adv/class_self.rb
  