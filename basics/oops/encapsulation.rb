# ruby basics/oops/encapsulation.rb

# Encapsulation means wrapping data (variables) and methods together inside a class and controlling access to that data.

# In Ruby, encapsulation is mainly achieved using:
# 1. public
# 2. private
# 3. protected
# 4. Getter and setter methods (attr_reader, attr_writer, attr_accessor)
p "----------using Getter and setter methods---------------"
class Student
  def initialize(name, age)
    @name = name
    @age = age
  end

  def display
    puts "Name: #{@name}"
    puts "Age: #{@age}"
  end
end

student = Student.new("John", 22)
student.display

# Here:
# - Student is a class.
# - @name and @age are instance variables.
# - display is a public method.
# - The data and methods are grouped inside the class.

p "-------------------------"
class Person
  # Public method
  def initialize(name, age)
    @name = name
    @age = age
  end

  # Public method
  def display_info
    puts "Name: #{@name}, Age: #{@age}"
  end

  protected
  def some_protected_method
    puts "PROTECTED METHOD"
  end

  # Private method
  private

  def secret_method
    puts "This is a secret method."
  end
end

person = Person.new("Alice", 30)
person.display_info # This will work
# person.some_protected_method # This will raise an error because some_protected_method is protected
# person.secret_method # This will raise an error because secret_method is private


# By default, all the methods you define will be public
# Private methods can only be used within the class definition;
# private methods can be accessed by calling with in a public method of the same class
# private method `some_private_method' called for #<Sample:0x0000021d7a847350> (NoMethodError)

# protected method `some_protected_method' called for #<Sample:0x000001d6b0137a80> (NoMethodError)
# protected methods can be accessed by calling with in a public method of the same class or subclass
p "-----------demo using Sample class----------------"
class Sample
  def some_public_method
    p "-------calling private and protected method from public method----------------"
    some_private_method
    some_protected_method
    puts "PUBLIC METHOD"
  end
  private
  def some_private_method
    puts "PRIVATE METHOD"
  end
  protected
  def some_protected_method
    puts "PROTECTED METHOD"
  end
  public
  def random_method
    p "-------calling private and protected method from public random_method----------------"
    s = Sample.new
    s.some_private_method
    s.some_protected_method
  end

  def public_method
    puts "Some public text"
    some_private_method
    some_protected_method
  end
end

class Test < Sample
  def test
    some_private_method
    some_protected_method
  end
end
p "----------calling methods using object--------------"
obj = Sample.new
obj.some_public_method # This will work and will call the private and protected methods from within the public method.
obj.public_method # This will work and will call the private and protected methods from within the public method.
#obj.random_method # we get HelloWorld.rb:18:in `random_method': private method `some_private_method' called for #<Sample:0x000055704771aba8> (NoMethodError)
#obj.some_private_method    #we cannot call a private method directly using a object
#obj.some_protected_method  #we cannot call a protected method directly using a object
p "-----------calling private and protected methods using send--------------"
Sample.new.send :some_private_method
Sample.new.send :some_protected_method
Sample.new.public_method
 p "-------calling private and protected method from public test method----------------"
t = Test.new
t.test

# Encapsulation notes:
# - Student encapsulates @name and @age together with display in one class.
#   Its instance variables are hidden from outside objects, and display provides
#   controlled access to the stored data.
# - Person also keeps @name and @age private to the object and exposes
#   display_info publicly. This allows callers to obtain information without
#   directly changing the internal instance variables.
# - Public methods are callable on an object from outside the class. In Ruby,
#   methods are public by default.
# - private makes a method callable without an explicit receiver inside the
#   class (and in subclasses). A private method cannot normally be called as
#   obj.some_private_method.
# - protected allows the method to be called only from the defining class or a
#   subclass, and Ruby permits it with another instance of that class or its
#   subclasses. It is more flexible than private but less accessible than public.
# - Sample uses public methods as interfaces that call private and protected
#   helper methods internally. This hides implementation details while exposing
#   only the public operations.
# - Test inherits the protected method and private method behavior from Sample.
#   Calling these helpers from Test's test method demonstrates encapsulation
#   through inheritance.
# - Ruby is also object-oriented but not as strictly restrictive as Java-style
#   languages: Object#send can bypass method visibility, although it is generally
#   used for introspection or metaprogramming rather than normal encapsulation.