class MyClass
end

# Define a singleton method for the MyClass class
class << MyClass
  def hello1
    "Hello1 from the singleton class of MyClass!"
  end

  def hello2
    "Hello2 from the singleton class of MyClass!"
  end
end

# Call the singleton method
puts MyClass.hello1
puts MyClass.hello2