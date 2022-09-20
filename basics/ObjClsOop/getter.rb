# ruby basics/ObjClsOop/getter.rb

# A getter method is a method that gets a value of an instance variable.
# Without a getter method, you can not retrieve a value of an instance variable outside the class the 
# instance variable is instantiated from.

#Here is an example.
class Movie
  def initialize(name)
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')
p obj1.name #=> undefined method `name' for #<Movie:0x007fecd08cb288 @name="Forrest Gump"> (NoMethodError)

#As you can see, the value of obj1 (name) can not be retrieved outside Movie class. if you try to retrive a value of an instance variable outside its class without a getter method, Ruby raises No Mothod Error.

# Now, Let's see how to retrieve the value of obj1 outside Movie class with a getter method.
# All you have to do here is to define a getter method named name. Though the name of a getter method can be 
# anything, it is common practice to name a getter method the instance variable’s name.

class Movie
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

obj1 = Movie.new('Forrest Gump')
p obj1.name #=> "Forrest Gump"