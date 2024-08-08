class Person
  def initialize(name)
    @name = name
  end
end

person1 = Person.new("bob")
person2 = Person.new("jane")

person1.instance_eval do
  def name
    @name.capitalize
  end
end

p person1.name
# p person2.name   # undefined method `name' for #<Person:0x000056414a80f048 @name="jane"> (NoMethodError)

Person.class_eval do
  def name
    @name.capitalize
  end
end

p person1.name
p person2.name
person3 = Person.new("Susan")
p person3.name