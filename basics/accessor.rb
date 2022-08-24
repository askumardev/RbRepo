# Accessors are a way to create getter and setter methods without explicitly defining them in a class.
# There are three types fo accessors in Ruby.

# attr_reader automatically generates a getter method for each given attribute.
# attr_writer automatically generates a setter method for each given attribute.
# attr_accessor automatically generates a getter and setter method for each given attribute.
# First, let's take a look at attr_reader!
# As you can see in the code below, name and year are retrieved outside Movie class even though there is no 
# getter method for either of them. This is because attr_reader generates a getter method for each given attribute.

class Movie
  attr_reader :name, :year

  def initialize(name, year)
    @name = name
    @year = year
  end
end
obj1 = Movie.new('Forrest Gump', 1994)
p obj1.name #=> Forrest Gump
p obj1.year #=> 1994

# Second, let's see how attr_writer works!
# As I mentioned above, attr_witer generates a setter method for each given attribute. Therefore you can assign 
# new values to ob1 without explicitly writing setter methods for name and year!

class Movie
  attr_reader :name, :year 
  attr_writer :name, :year

  def initialize(name, year)
    @name = name
    @year = year
  end
end
obj1 = Movie.new('Forrest Gump', 1994)
obj1.name = 'Fight Club'
obj1.year = 1999
p obj1.name #=> "Fight Club"
p obj1.year #=> 1999

# Last but certainly not least, attr_accessor does what attr_reader and attr_writer do with just one line of code! 
# It will automatically generate a getter and setter mehod for each given attribute.

class Movie
  attr_accessor :name, :year

  def initialize(name, year)
    @name = name
    @year = year
  end
end
obj1 = Movie.new('Forrest Gump', 1994)
obj1.name = 'Fight Club'
obj1.year = 1999
p obj1.name #=> "Fight Club"
p obj1.year #=> 1999