class GrandParent
    def say(message)
      p "GrandParent: #{message}"
    end
  end
  
  class Parent < GrandParent
    def say(message)
        p "Parent: #{message}"
        #super
      end
  end
  
  class Child < Parent
    def say(message)
      super
    end
  end
  
  Child.new.say('Hi Rubyist!') # => "GrandParent: Hi Rubyist!"