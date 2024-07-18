# ruby adv/monkey_patching.rb

# Monkey patching in Ruby refers to the practice of dynamically modifying or extending classes or modules at runtime.
# While it can be a powerful tool,
# it should be used with caution as it can lead to unexpected behavior and maintenance challenges.

class User
  attr_accessor :name, :age
  def initialize(name,age)
    @name = name
    @age = age
  end
end
u = User.new("John",22)
#p u.name

class User
  def print_user
    p "The user name is: #{@name}"
    p "The user age is: #{@age}"
  end
end
u.print_user



# class Object
#   def print_to_s
#     puts("---#{to_s}")
#   end
# end

# "cat".print_to_s
# Time.now.print_to_s

# class Time
#   def print_to_s
#     puts("=====#{to_s}")
#   end
# end

# Time.now.print_to_s
