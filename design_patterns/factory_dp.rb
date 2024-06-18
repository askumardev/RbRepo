# The Factory Method pattern defines an interface for creating an object but lets subclasses alter the type of 
# objects that will be created.

class Animal
  def speak
    raise NotImplementedError, "This method should be overridden"
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end
end

class Cat < Animal
  def speak
    "Meow!"
  end
end

class AnimalFactory
  def self.create_animal(type)
    case type
    when :dog then Dog.new
    when :cat then Cat.new
    else raise "Unknown animal type"
    end
  end
end

animal = AnimalFactory.create_animal(:dog)
puts animal.speak  # Output: Woof!

animal = AnimalFactory.create_animal(:cat)
puts animal.speak  # Output: Woof!


# ruby design_patterns/factory_dp.rb

# class Endpoint
#   def home(params)
#     if params[:user_type] == "admin"
#       Admin.new
#     elsif params[:user_type] == "member"
#       Member.new
#     else
#       Guest.new
#     end
#   end

#   def contacts(params)
#     if params[:user_type] == "admin"
#       Admin.new
#     elsif params[:user_type] == "member"
#       Member.new
#     else
#       Guest.new
#     end
#   end
# end