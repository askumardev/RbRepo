# ruby adv/singleton_methods.rb

class Thing
  class << self
    def hello(name)
      puts "Hello #{name}"
    end
  end
end
Thing.hello("John")

puts("-----------Alternate way below-----------------------")
class Thing
end

thing = Thing.new
class << thing
  def dosomething
    puts "Belongs to thing"
  end
end

thing.dosomething
