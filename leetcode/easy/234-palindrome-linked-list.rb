# Given a singly linked list, determine if it is a palindrome.

# Example 1:

# Input: 1->2
# Output: false
# Example 2:

# Input: 1->2->2->1
# Output: true

def is_palindrome(head)
  stack = []
  queue = []
  
  while head != nil
    stack.unshift(head.val)
    queue << head.val
    
    head = head.next
  end
  
  stack == queue
end
