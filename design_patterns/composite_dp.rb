# The Composite pattern is used to treat individual objects and compositions of objects uniformly. 
# It allows you to build a tree structure where individual objects and their compositions are treated as the same type. 
# This pattern is particularly useful for representing hierarchies of objects.

# Here's an example of how to implement the Composite pattern in Ruby:

# Example: File System
# Let's consider a simple file system where we have files and directories. Directories can contain both files and other directories. 
# We will use the Composite pattern to represent this hierarchy.

# 1. Component Interface
# First, we define a common interface for both files and directories.

class FileSystemComponent
  def name
    raise NotImplementedError, "This method should be overridden"
  end

  def add(component)
    raise NotImplementedError, "This method should be overridden"
  end

  def remove(component)
    raise NotImplementedError, "This method should be overridden"
  end

  def display(indent = 0)
    raise NotImplementedError, "This method should be overridden"
  end
end

# 2. Leaf: File
# Next, we define the File class, which is a leaf node in the composite structure.

class File < FileSystemComponent
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def add(component)
    raise "Cannot add to a file"
  end

  def remove(component)
    raise "Cannot remove from a file"
  end

  def display(indent = 0)
    puts "#{' ' * indent}- #{@name}"
  end
end

# 3. Composite: Directory
# Then, we define the Directory class, which is a composite node that can contain both files and other directories.

class Directory < FileSystemComponent
  def initialize(name)
    @name = name
    @children = []
  end

  def name
    @name
  end

  def add(component)
    @children << component
  end

  def remove(component)
    @children.delete(component)
  end

  def display(indent = 0)
    puts "#{' ' * indent}+ #{@name}"
    @children.each { |child| child.display(indent + 2) }
  end
end

# Finally, we use these classes to create a file system hierarchy and display it.
# Create files
file1 = File.new("File1.txt")
file2 = File.new("File2.txt")
file3 = File.new("File3.txt")

# Create directories
dir1 = Directory.new("Dir1")
dir2 = Directory.new("Dir2")
dir3 = Directory.new("Dir3")

# Build the directory tree
dir1.add(file1)
dir1.add(dir2)

dir2.add(file2)
dir2.add(dir3)

dir3.add(file3)

# Display the directory tree
dir1.display



# ruby design_patterns/composite_dp.rb
