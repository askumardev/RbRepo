# ruby basics/ObjClsOop/method_overriding.rb

class GrandParent
  def say(message)
    p "GrandParent: #{message}"
  end
end

class Parent < GrandParent
  def say(message)
    p "Parent: #{message}"
    # super
  end
end

class Child < Parent
end

Child.new.say('Hi Rubyist!') # => "GrandParent: Hi Rubyist!"
