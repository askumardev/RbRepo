# ruby adv/monkey_patching.rb

# Monkey patching in Ruby refers to the practice of dynamically modifying or extending classes or modules at runtime.
# While it can be a powerful tool,
# it should be used with caution as it can lead to unexpected behavior and maintenance challenges.

class String
  def say
    self.upcase + "!!!"
  end
end

puts "hello".say  # Output: HELLO!!!

# In this example, we're adding a shout method to the existing String class, which was not originally part of the Ruby String class.


# class User
#   #attr_accessor :name, :age
#   def initialize(name,age)
#     @name = name
#     @age = age
#   end
# end

# #p u.name

# class User
#   def print_user
#     p "The printed user name is: #{@name}"
#     p "The printed user age is: #{@age}"
#   end
# end

# class User
#   def display_user
#     p "The displayed user name is: #{@name}"
#     p "The displayed user age is: #{@age}"
#   end
# end

# u = User.new("John",22)
# u.print_user
# u = User.new("Cena",25)
# u.display_user



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
