# frozen_string_literal: true

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
