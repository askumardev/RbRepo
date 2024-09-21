# ruby leetcode/easy/234-palindrome-linked-list.rb

# Given a singly linked list, determine if it is a palindrome.

# Example 1:
# Input: 1->2
# Output: false

# Example 2:
# Input: 1->2->2->1
# Output: true

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  
  def initialize(val)
    @val = val
    @next = nil
  end
end

# Function to check if the linked list is a palindrome
def is_palindrome(head)
  p head
  stack = []  #stack is used to store the values in reverse order.
  queue = []  #queue is used to store the values in their original order.
  
  while head != nil
    stack.unshift(head.val)  # Add to the start (for reverse order)
    queue << head.val        # Add to the end (for normal order)
    head = head.next         # Move to the next node
  end
  p stack
  p queue
  
  stack == queue  # Compare reversed and normal order
end

# Helper function to create a linked list from an array
def create_linked_list(arr)
  return nil if arr.empty?
  
  head = ListNode.new(arr[0])
  current = head
  arr[1..].each do |val|
    current.next = ListNode.new(val)
    current = current.next
  end
  head
end

# Example: Testing with a non-palindrome linked list (1 -> 2)
head = create_linked_list([1, 2])
puts is_palindrome(head)  # Output: false (not a palindrome)

head = create_linked_list([1, 2, 2, 1])
puts is_palindrome(head)  # Output: true (is a palindrome)

# def is_palindrome(head)
#   stack = []
#   queue = []
  
#   while head != nil
#     stack.unshift(head.val)
#     queue << head.val
    
#     head = head.next
#   end
  
#   stack == queue
# end

# is_palindrome("1->2")
