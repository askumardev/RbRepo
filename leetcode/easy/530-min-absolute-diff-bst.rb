# ruby leetcode/easy/530-min-absolute-diff-bst.rb

# Given a binary search tree with non-negative values, find the minimum absolute difference between values of any two nodes.
# [1,null,3,2]
# Output:
# 1
# Note:

# There are at least two nodes in this BST.
# Explanation:
# The minimum absolute difference is 1, which is the difference between 2 and 1 (or between 2 and 3).
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
# @return {Integer}

def get_minimum_difference(root)   
  @min_diff = nil
  @prev_node = nil
  traverse(root)
  
  @min_diff
end

def traverse(root)
  return if root.nil?
  
  traverse(root.right)
  
  if @prev_node
    possible_min = (root.val - @prev_node).abs
    
    @min_diff = possible_min if @min_diff.nil? || possible_min < @min_diff
  end
  
  @prev_node = root.val
  
  traverse(root.left)
end