# ruby leetcode/medium/2-add-two-numbers.rb

# You are given two non-empty linked lists representing two non-negative integers.
# The digits are stored in reverse order and each of their nodes contain a single digit.
# Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero,
# except the number 0 itself.

# Example:

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.
# Definition for singly-linked list.



class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def build_list(arr)
  dummy = ListNode.new(0)
  current = dummy
  arr.each { |val| current.next = ListNode.new(val); current = current.next }
  dummy.next
end

def list_to_array(node)
  result = []
  while node
    result << node.val
    node = node.next
  end
  result
end

def add_two_numbers(l1, l2)
  dummy = ListNode.new(0)
  current = dummy
  carry = 0

  while l1 || l2 || carry > 0
    sum = carry
    sum += l1.val and l1 = l1.next if l1
    sum += l2.val and l2 = l2.next if l2

    carry, digit = sum.divmod(10)
    current.next = ListNode.new(digit)
    current = current.next
  end

  dummy.next
end

# ── Test Cases ────────────────────────────────────────────────
test_cases = [
  { l1: [2, 4, 3], l2: [5, 6, 4],    desc: "342 + 465 = 807" },
  { l1: [0],       l2: [0],           desc: "0 + 0 = 0" },
  { l1: [9, 9, 9, 9, 9, 9, 9], l2: [9, 9, 9, 9], desc: "9999999 + 9999 = 10009998" },
  { l1: [5],       l2: [5],           desc: "5 + 5 = 10 (carry edge case)" },
]

test_cases.each_with_index do |tc, i|
  l1     = build_list(tc[:l1])
  l2     = build_list(tc[:l2])
  result = add_two_numbers(l1, l2)
  output = list_to_array(result)

  puts "Test #{i + 1}: #{tc[:desc]}"
  puts "  Input  : #{tc[:l1].inspect} + #{tc[:l2].inspect}"
  puts "  Output : #{output.inspect}"
  puts
end
