# ruby solutions/get_set.rb

class Person
  # Manually defined getter method
  def manual_name
    @manual_name
  end

  # Manually defined setter method
  def manual_name=(new_name)
    @manual_name = new_name
  end

  # Using attr_accessor to automatically create getter and setter
  attr_accessor :auto_name

  # Using attr_reader to automatically create only the getter
  attr_reader :read_only_name

  # Using attr_writer to automatically create only the setter
  attr_writer :write_only_name

  def initialize(manual_name, auto_name, read_only_name, write_only_name)
    @manual_name = manual_name
    @auto_name = auto_name
    @read_only_name = read_only_name
    @write_only_name = write_only_name
  end
end

# Usage
person = Person.new("John", "Jane", "Doe", "Smith")

# Accessing manually defined getter and setter
puts "Manually defined getter and setter:"
puts "Manual Name: #{person.manual_name}"
person.manual_name = "Jack"
puts "Updated Manual Name: #{person.manual_name}"

# Accessing automatically created getter and setter using attr_accessor
puts "\nUsing attr_accessor:"
puts "Auto Name: #{person.auto_name}"
person.auto_name = "Janet"
puts "Updated Auto Name: #{person.auto_name}"

# Accessing automatically created getter using attr_reader
puts "\nUsing attr_reader:"
puts "Read Only Name: #{person.read_only_name}"

# Accessing automatically created setter using attr_writer
puts "\nUsing attr_writer:"
person.write_only_name = "Williams"
puts "Updated Write Only Name: #{person.write_only_name}"

# In this example, I've created a Person class with various attributes and demonstrated different 
# ways to define and use getter and setter methods. The program initializes a Person object and 
# showcases the manipulation of each attribute using the various getter and setter methods.