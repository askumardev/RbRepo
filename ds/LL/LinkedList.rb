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
    if @head.nil?
      @head = Node.new(value)
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def delete(value)
    return if @head.nil?

    if @head.value == value
      @head = @head.next_node
    else
      current = @head
      current = current.next_node until current.next_node.nil? || current.next_node.value == value
      current.next_node = current.next_node.next_node unless current.next_node.nil?
    end
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

list.delete(20)
puts "List after deleting 20: #{list}"
# Output: List after deleting 20: 5 -> 10 -> 30

position = list.find_position(10)
puts "Position of node with value 10: #{position}" if position
# Output: Position of node with value 10: 1
