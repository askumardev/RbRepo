class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)




#---------------------------------------------------------------
# TypeProf is a type analysis tool bundled in the Ruby package.

# Currently, TypeProf serves as a kind of type inference.

# It reads plain (non-type-annotated) Ruby code, analyzes what methods are 
# defined and how they are used, and generates a prototype of type signature in RBS format.


#run by typing typeprof typeprof_test.rb

#Below is returned

# class User
#   attr_reader name : String
#   attr_reader age : Integer
#   def initialize : (name: String, age: Integer) -> [String, Integer]
# end
#------------------------------------------------------------------------
