# ruby interview/norwin_trane.rb

super
types of inheritence
modules
scopes
meta programming
orm
monkey patching
design pattern
singleton class



arr = [1,1,2,3,1,2,4,4,4,4,5,5,5,5]

hsh = arr.tally
max_count = hsh.values.max

most_frequent = hsh.select { |key, count| count == max_count }.keys

p most_frequent
# [4, 5]


-------------------------------------------

request response cycle

inheritance

how to accessa class method from another class without inheritance
You can access another class's methods without inheritance using class methods, object instantiation, module methods, or dependency injection.

1. Class Methods: If the method you want to access is defined as a class method, you can call it directly on the class without creating an instance.
class User
  def greeting
    "Hello from User"
  end
end

class Employee
  def initialize
    @user = User.new
  end

  def display
    puts @user.greeting
  end
end

Employee.new.display

2. Object Instantiation: You can create an instance of the other class and then call its methods on that instance.
class User
  def self.greeting
    "Hello from User"
  end
end

class Employee
  def display
    puts User.greeting
  end
end

Employee.new.display


3. Module Methods: If the method is defined in a module, you can include or extend that module in your class to gain access to its methods.
module Greetings
  def self.greeting
    "Hello"
  end
end

class User
  def display
    puts Greetings.greeting
  end
end

class Employee
  def display
    puts Greetings.greeting
  end
end


4. Dependency Injection: You can pass an instance of the other class as a parameter to your class, allowing you to call its methods.
class UserService
  def greeting
    "Hello from UserService"
  end
end

class Employee
  def initialize(user_service)
    @user_service = user_service
  end

  def display
    puts @user_service.greeting
  end
end

service = UserService.new
employee = Employee.new(service)

employee.display


mvc -> model

what is dsa

any sort program

input: [1,2,3,4,5,6,7,8,9,10]
o/p: [10,1,9,2,8,3,7,4,6,5]
