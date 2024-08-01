# ruby adv/moduleDemo.rb

module Swimmer
  def self.swim
    puts "I can swim!"
  end
end
Swimmer.swim
p "---------------------------"
module Swimmer1
  def swim
    puts "I can swim!"
  end
end
person = Object.new
person.extend(Swimmer1)
person.swim
p "---------------------------"
module Swimmer2
  def swim
    puts "I can swim!"
  end
end

class Person
  include Swimmer2
end
person = Person.new
person.swim
p "---------------------------"

module Swimmer
  def swim
    puts "I can swim!"
  end
end

class Person
  extend Swimmer
end

Person.swim
