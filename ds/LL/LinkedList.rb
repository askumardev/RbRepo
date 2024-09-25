# ruby ds/LL/LinkedList.rb

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node = new_node
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def delete(value)
    return if @head.nil?

    if @head.value == value
      @head = @head.next_node
      return true
    end

    current = @head
    while current.next_node
      if current.next_node.value == value
        current.next_node = current.next_node.next_node
        return true
      end
      current = current.next_node
    end
    false
  end

  def find_position(value)
    current = @head
    position = 0
    while current
      return position if current.value == value
      current = current.next_node
      position += 1
    end
    nil
  end

  def to_s
    elements = []
    current = @head
    while current
      elements << current.value
      current = current.next_node
    end
    elements.join(" -> ")
  end
end

# Usage
list = LinkedList.new
list.append(10)
list.append(20)
list.append(30)
list.prepend(5)

puts "List: #{list}"
# Output: List: 5 -> 10 -> 20 -> 30

if list.delete(20)
  puts "List after deleting 20: #{list}"
else
  puts "Value 20 not found for deletion."
end
# Output: List after deleting 20: 5 -> 10 -> 30

position = list.find_position(10)
puts "Position of node with value 10: #{position}" if position
# Output: Position of node with value 10: 1
