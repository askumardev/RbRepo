class Animal
  def name
    puts "Animal"
  end
end
class Cat < Animal
  # def name
  #   super
  # end
  super
end
cat = Cat.new
cat.name