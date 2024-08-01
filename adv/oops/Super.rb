# ruby adv/oops/Super.rb

class Animal
  def name
    puts 'Animal'
  end
end

class Cat < Animal
  def name
    # return "cat" #returns string cat and exits method
    super
  end
  #super #`<class:Cat>': super called outside of method (NoMethodError)
end
cat = Cat.new
puts cat.name


class Grandparent
  def foo
    "Hello from Grandparent"
  end
end

class Parent < Grandparent
  def foo
    super
  end
end

class Child < Parent
  def foo
    super
  end
end

child = Child.new
puts child.foo


class Parent
  def greet(name)
    "Hello, #{name}!"
  end
end

class Child < Parent
  def greet(name, age)
    super(name) + " You are #{age} years old."
  end
end

child = Child.new
puts child.greet("Rahul", 25) # Output: "Hello, Rahul! You are 25 years old."
