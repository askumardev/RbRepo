#By default, all the methods you define will be public

# Private methods can only be used within the class definition;
#private methods can be accessed by calling with in a public method of the same class
#private method `some_private_method' called for #<Sample:0x0000021d7a847350> (NoMethodError)

#protected method `some_protected_method' called for #<Sample:0x000001d6b0137a80> (NoMethodError)

class Sample
  def some_public_method
    some_private_method
    some_protected_method
    puts "PUBLIC METHOD"
  end
  private
  def some_private_method
    puts "PRIVATE METHOD"
  end
  protected
  def some_protected_method
    puts "PROTECTED METHOD"
  end
  public
  def random_method
    s = Sample.new
    s.some_private_method
    s.some_protected_method
  end
end

obj = Sample.new
obj.some_public_method
obj.random_method
#obj.some_private_method    #we cannot call a private method directly using a object
#obj.some_protected_method  #we cannot call a protected method directly using a object
# Sample.new.send :some_private_method
# Sample.new.send :some_protected_method