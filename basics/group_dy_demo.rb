words = ["apple", "tree", "visit", "date", "elephant"]
result = words.group_by { |word| word.length }

puts result
p"--------------"
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
result = numbers.group_by { |number| number % 2 }

p result
p"--------------"

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end
people = [
  Person.new("Aman", 25),
  Person.new("Pulkit", 30),
  Person.new("Ritwik", 25)
]
result = people.group_by { |person| person.age }
puts result
p"--------------"

strings = ["apple", "america", "delhi", "date", "scaler"]
result = strings.group_by { |string| string[0] }

puts result