class SampleCls
  @@val = 10
  def sampleFun
    @@val
  end

  def initialize
    puts "This object was initialized!"
  end
  def self.sampleClsFun
    @@val
  end
  
end

class Animal
  @@count = 0

  def self.count
    @@count = 0
  end

  def self.count=(n)
    @@count = n
  end

  def initialize
    @@count += 1
  end
end

class Cat < Animal
end

class Dog < Animal
end

frog = Class.new do
  def jump
    puts "Jumping..."
  end
end
f = frog.new
f.jump
puts frog.instance_methods.sort
p "#####################"
Animal.new
Cat.new

p "Animal count :#{Animal.count}"
p "Cat count : #{Cat.count}"
p "#############################"
p SampleCls.new
p"---------------------"
p SampleCls.new.sampleFun
p "----------------------------"
p SampleCls.sampleClsFun