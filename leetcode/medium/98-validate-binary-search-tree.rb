# ruby leetcode/medium/98-validate-binary-search-tree.rb

# Given a binary tree, determine if it is a valid binary search tree (BST).

# Assume a BST is defined as follows:

# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and right subtrees must also be binary search trees.
 
# Example 1:
#     2
#    / \
#   1   3

# Input: [2,1,3]
# Output: true

# Example 2:

#     5
#    / \
#   1   4
#      / \
#     3   6

# Input: [5,1,4,null,null,3,6]
# Output: false

# Explanation: The root node's value is 5 but its right child's value is 4.

def is_valid(node, lower, upper)
  return true unless node
  val = node.val
  
  return false if val <= lower || val >= upper 
  return false if node.right && is_valid(node.right, val, upper) == false
  return false if node.left && is_valid(node.left, lower, val) == false
   
  true
end

def is_valid_bst(root)
  is_valid(root, -Float::INFINITY, Float::INFINITY)
end