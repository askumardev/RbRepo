# ruby interview/encora.rb

module Swimmer
  def swim
    puts "I can swim!"
  end
end

class Abc
  include Swimmer
end

class A
  extend Swimmer
end

a = Abc.new.swim

A.swim

hsh = {x: 1, y: nil, z: 3}
p hsh.select { |k, v| !v.nil? }

p "satish".object_id

#Emplyee.salary(order: :desc).offset(2).last