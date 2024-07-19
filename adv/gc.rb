# ruby adv/gc.rb

class MyObject
  def initialize(name)
    @name = name
    puts "Creating #{@name}"
  end

  def finalize
    puts "Destroying #{@name}"
  end
end

# Creating some objects
obj1 = MyObject.new("Object 1")
p obj1
obj2 = MyObject.new("Object 2")
p obj2

# Manually triggering garbage collection
p GC.start

# Unsetting the objects
obj1 = nil
obj2 = nil

# Manually triggering garbage collection again
GC.start

puts "End of the program"
p "====================================="

class Foo
  def initialize
    @bar = "Hello, world!"
  end
end

# Create a large number of objects
100_000.times do
  Foo.new
end

# Manually trigger garbage collection
GC.start

# Check the current garbage collection statistics
puts GC.stat


# class Person
#   attr_accessor :name, :friend

#   def initialize(name)
#     @name = name
#   end

#   def display_info
#     puts "Name: #{@name}"
#     puts "Friend: #{friend ? friend.name : 'None'}"
#   end
# end

# # Creating objects
# person1 = Person.new("Alice")
# person2 = Person.new("Bob")

# # Creating a reference cycle
# person1.friend = person2
# person2.friend = person1

# # Displaying information
# puts "Person 1:"
# person1.display_info

# puts "\nPerson 2:"
# person2.display_info


#   In this example, we have a Person class with a simple attribute name.
#   Two instances of the Person class, person1 and person2, are created.
#   Additionally, we create a reference cycle by making each person a friend of the other.

#   Now, let's break the reference cycle by setting the friend attribute to nil for both person1 and person2.
#    This step is crucial because it allows the garbage collector to identify that there are no more references to the objects involved in the cycle.

#   Finally, we manually trigger garbage collection using GC.start. Note that in a real-world scenario,
#   you generally wouldn't need to manually invoke garbage collection; it happens automatically in the background.

#   In this case, when the garbage collector runs, it marks and identifies objects that are still reachable from
#   the root (global variables, local variables, etc.).
#   Objects that are not reachable (in this case, person1 and person2 after breaking the reference cycle) are considered for deallocation, and their memory is freed up.

#   Understanding garbage collection is important for managing memory efficiently, but in most
#   Ruby applications, developers don't need to worry about it actively. The automatic garbage collector
#   takes care of reclaiming memory, making the language more convenient for developers.

# In Ruby, garbage collection is the process of automatically reclaiming and freeing up memory that is no longer in use by the program.
#  Ruby uses a garbage collector to manage memory and ensure that objects that are no longer reachable are identified and deallocated.

# The garbage collector in Ruby uses a mark-and-sweep algorithm, and the primary steps in the garbage collection process are as follows:

# Marking Phase:
# The garbage collector starts by marking all objects that are still in use and reachable from the root of the program.
# The root typically includes global variables, local variables, and references in the call stack.
# It recursively follows references from the root, marking objects as reachable.

# Sweeping Phase:
# Once the marking phase is complete, the garbage collector sweeps through the entire heap, deallocating (freeing) memory for
# objects that were not marked as reachable.
# This phase reclaims memory occupied by objects that are no longer accessible.

# Compact Phase (Optional):
# Some garbage collectors may include a compaction step after sweeping.
# Compaction involves moving the remaining objects in memory closer together to reduce fragmentation and make better use of available memory.
# Ruby's garbage collector runs periodically in the background to reclaim memory, and it is designed to be transparent to the developer.
# However, understanding how garbage collection works is essential for writing efficient and memory-conscious code.

# Developers can also manually trigger garbage collection using the GC.start method, but this is typically not necessary in most Ruby applications.
# It's important to note that relying on manual garbage collection is generally discouraged, as the automatic garbage collector is well-tuned for most scenarios.
