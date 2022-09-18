# ruby leetcode/medium/2-add-two-numbers.rb

# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse 
# order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Example:

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)  
  val1 = traverse(l1, 0, 0)
  val2 = traverse(l2, 0, 0)
  
  create_linked_list(val1 + val2)
end

def traverse(node, val, count)
  return val if node.nil?
  
  val += node.val * 10 ** count
  
  count += 1
  
  traverse(node.next, val, count)
end

def create_linked_list(sum)
  sum = sum.to_s.reverse.split('')
  
  first_head = ListNode.new(sum[0].to_i)
  head = first_head
  
  sum[1..sum.size - 1].each do |char|
    head.next = ListNode.new(char.to_i)
    
    head = head.next
  end
  
  first_head
end
