# frozen_string_literal: true

class Dog
  def self.bark
    puts 'hello'
    puts self.class
    puts self
  end
end

Dog.bark
