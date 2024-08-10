# ruby basics/method_resolution.rb

module MyModule
  def my_method
    puts 'MyModule method'
  end
end

class MyBaseClass
  include MyModule

  def my_method
    puts 'MyBaseClass method'
  end
end

class MySubClass < MyBaseClass
  def my_method
    puts 'MySubClass method'
  end
end

obj = MySubClass.new
obj.my_method


# MySubClass: Ruby finds the my_method in MySubClass and executes it.
# MyBaseClass: This would be checked if my_method wasn't defined in MySubClass.
# MyModule: This is checked if neither MySubClass nor MyBaseClass defined my_method.
# Since MySubClass has its own my_method, it takes precedence over the methods defined in MyBaseClass or MyModule.