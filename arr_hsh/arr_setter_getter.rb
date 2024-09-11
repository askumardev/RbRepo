# ruby arr_hsh/arr_setter_getter.rb

class MyClass
  attr_accessor :my_array

  def initialize
    @my_array = []
  end
end

obj = MyClass.new
obj.my_array = [1, 2, 3]  # Setter
p obj.my_array            # Getter

class ArrayDemo
  def initialize
    @arr = []
  end

  def getArray
    @arr
  end

  def setArray(arr)
    @arr = arr
  end
end

obj = ArrayDemo.new
obj.setArray([1,2,3,4,5])
p obj.getArray
obj.setArray([1,2,3,4,5,6])
p obj.getArray

# class ArrayDemo
#   def initialize()
#     @numbers = Array.new(10)
#   end

#   def addValue(index, data)
#     @numbers[index] = data
#   end

#   def getValue(index)
#     return @numbers[index]
#   end
# end

# d = ArrayDemo.new()
# d.addValue(0, 1)
# d.addValue(1, 2)
# puts d.getValue(0)
# puts d.getValue(1)
