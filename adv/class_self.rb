class MyClass
  def self.class_method
    puts "This is a class method"
  end

  class << self
    def another_class_method
      puts "This is another class method"
    end
  end
end

# Calling class methods
MyClass.class_method      # Output: This is a class method
MyClass.another_class_method  # Output: This is another class method


# ruby adv/class_self.rb
  