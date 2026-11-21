
# ruby adv/class_hierarchy.rb

class Person
  attr_accessor :name,:age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end
  
  def say_hello
    puts "Hello, my name is #{self.name}."
  end
end

class Programmer < Person
  def tell_us_what_you_love
    puts "I love programming!"
  end
end

betsy = Programmer.new("Betsy", 28)
betsy.say_hello
betsy.tell_us_what_you_love

p Programmer.ancestors #[Programmer, Person, Object, Kernel, BasicObject]
p Person.ancestors #[Person, Object, Kernel, BasicObject]
p Object.ancestors #[Object, Kernel, BasicObject]
cls = Object.class
p cls.ancestors #[Class, Module, Object, Kernel, BasicObject]
puts("---------BasicObject.methods----------")
p BasicObject.methods
puts("=========Kernel.methods===========")
p Kernel.methods