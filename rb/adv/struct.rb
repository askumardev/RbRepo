# In Ruby, a Struct is a convenient way to create simple classes with attributes without having to define explicit getter and setter methods. 
# It is often used for lightweight data structures. A Struct in Ruby automatically provides getter and setter methods, an initializer, 
# and other useful methods like to_s and inspect.

# Here's an example of how to use Struct in Ruby:


Person = Struct.new(:name, :age)

person = Person.new("John", 30)
puts person.name  # Output: John
puts person.age   # Output: 30

Address = Struct.new(:street, :city, :zip)

# class Address
#   def full_address
#     p "#{street} #{city} #{zip}"
#   end
# end

home = Address.new('Broadway', 'NYC', 10040)
p home
# home.full_address # => "Broadway NYC 10040"

p("-----------alternate way------")

Struct.new('Address', :street, :city, :zip)
Struct::Address.superclass # => Struct

home = Struct::Address.new('Broadway', 'NYC', 10040)
p home.class # => Struct::Address
p home.city # "NYC"
p Address.ancestors

# ruby adv/struct.rb