# ruby leetcode/easy/501-find-mode-in-bst.rb

# Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in 
# the given BST.

# Assume a BST is defined as follows:

# The left subtree of a node contains only nodes with keys less than or equal to the node's key.
# The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
# Both the left and right subtrees must also be binary search trees.
 

# For example:
# Given BST [1,null,2,2]
# return [2].

# Note: If a tree has more than one mode, you can return them in any order.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}

def find_mode(root)
  hash = Hash.new(0)
  traverse(root, hash)
  
  max = hash.values.max
  hash.select{ |k ,v| v == max }.keys
end

def traverse(root, hash)
  return if root.nil?
  
  hash[root.val] += 1
  
  traverse(root.left, hash)
  traverse(root.right, hash)
end