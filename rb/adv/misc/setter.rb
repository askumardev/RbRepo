# ruby basics/ObjClsOop/setter.rb

# A setter is a method that sets a value of an instance variable.
# Without a setter method, you can not assign a value to an instance variable outside its class.
# if you try to set a value of an instance variable outside its class, Ruby raises No Method Error 
# just like it does when you try to retrieve a value of an instance variable outside its class 
# without a getter method.

class Movie
  def initialize(name)
    @name = name
  end

  def name #getter method
    @name
  end
end

obj1 = Movie.new('Forrest Gump')
p obj1.name #=> "Forrest Gump"
obj1.name = 'Fight Club' #=> undefined method `name=' for #<Movie:0x007f9937053368 @name="Forrest Gump"> (NoMethodError)

# Defining a setter method inside a class makes it possible to set a value of an instance variable outside the class.
# You can define a setter method like the code below.

class Movie
  def initialize(name)
    @name = name
  end

  def name #getter method
    @name
  end

  def name=(name) #setter method
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')
p obj1.name #=> "Forrest Gump"
obj1.name = 'Fight Club'
p obj1.name #=> "Fight Club"
#By using name=, you can now assign a new value Fight Club to obj1.