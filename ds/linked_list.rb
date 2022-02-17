class LinkedList
    def initialize
      @head = nil
    end
  
    def append(value)
      if @head
        find_tail.next = Node.new(value)
      else
        @head = Node.new(value)
      end
    end
  
    def find_tail
      node = @head
  
      return node if !node.next
      return node if !node.next while (node = node.next)
    end
  
    def append_after(target, value)
      node           = find(target)
  
      return unless node
  
      old_next       = node.next
      node.next      = Node.new(value)
      node.next.next = old_next
    end
  
    def find(value)
      node = @head
  
      return false if !node.next
      return node  if node.value == value
  
      while (node = node.next)
        return node if node.value == value
      end
    end
  
    def delete(value)
      if @head.value == value
        @head = @head.next
        return
      end
  
      node      = find_before(value)
      node.next = node.next.next
    end
  
    def find_before(value)
      node = @head
  
      return false if !node.next
      return node  if node.next.value == value
  
      while (node = node.next)
        return node if node.next && node.next.value == value
      end
    end
  
    def print
      node = @head
      puts node
  
      while (node = node.next)
        puts node
      end
    end
  end

  class Node
    attr_accessor :next
    attr_reader   :value
  
    def initialize(value)
      @value = value
      @next  = nil
    end
  
    def to_s
      "Node with value: #{@value}"
    end
  end

  list = LinkedList.new

list.append(10)
list.append(20)
list.append(30)

list.append_after(10, 15)
list.append_after(20, 25)

list.print


#linked list is composed nodes, each node has a data, than it points to the next node
# class LinkedList 

#   #is_empty?: return true if the linked list is empty
#   def is_empty?
#     if @head == nil
#         return true 
#     else
#         return false
#     end
#   end

#   #push: given a data, add a new node in the end
#   def push(data)
#     if self.is_empty?
#         @head = Node.new(data)
#     else
#         current_node = @head
#         new_node = Node.new(data)
#         while current_node.next != nil
#             current_node = current_node.next 
#         end
#         current_node.next = new_node
#     end
#   end

#   #unshift: add a new node in the front
#   def unshift(data)
#     if self.is_empty?
#         @head = Node.new(data)
#     else
#         curr_head = Node.new(data)
#         curr_head.next = @head 
#         @head = curr_head
#     end
#   end

#   #pop: remove the last node and return it
#   def pop 
#     if self.is_empty?
#         return "Can't pop the element, this list is currently empty"
#     else
#         current_node = @head 
#         while current_node.next.next != nil
#             current_node = current_node.next 
#         end
#         last_node = current_node.next 
#         current_node.next = nil 
#     end
#     last_node
#   end


#   #shift: remove the first node and return it
#   def shift 
#     if self.is_empty?
#         return "This list is currently empty"
#     else
#         curr_head = @head
#         new_head = @head.next 
#         @head.next = nil 
#         @head = new_head
#     end
#     curr_head
#   end

#   #size: return the length of linked list
#   def size 
#     if self.is_empty?
#         count = 0 
#     else
#         count = 1 
#         current_node = @head 
#         while current_node.next != nil 
#             current_node = current_node.next 
#             count += 1
#         end
#     end
#     count 
#   end

  
#   #pretty_print: print the current linked list as an array
#   def pretty_print
#     array = []
#     current_node = @head 
#     if self.is_empty?
#         return array
#     else 
#         while current_node.next != nil
#             array << current_node.data 
#             current_node = current_node.next
#         end
#         array << current_node.data 
#     end
#     array
#   end


#   #clear: clear the whole linked list
#   def clear 
#     @head = nil 
#   end
# end

# list = LinkedList.new

# list.push(1)
# list.push(2)
# list.push(3)
# list.push(4)
# list

# list.unshift(0)
# list

# list.pretty_print
# list.size