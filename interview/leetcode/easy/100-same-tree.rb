# ruby leetcode/easy/100-same-tree.rb

# Given two binary trees, write a function to check if they are the same or not.

# Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

# Example 1:

# Input:     1         1
#           / \       / \
#          2   3     2   3

#         [1,2,3],   [1,2,3]
# Output: true

# Example 2:
# Input:     1         1
#           /           \
#          2             2

#         [1,2],     [1,null,2]
# Output: false

# Example 3:
# Input:     1         1
#           / \       / \
#          2   1     1   2

#         [1,2,1],   [1,1,2]
# Output: false

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?
  return false if p.val != q.val

  is_same_tree(p.left, q.left) &&
    is_same_tree(p.right, q.right)
end
p "----------------------------------------"
# Tree 1
#      1
#     / \
#    2   3
tree1 = TreeNode.new(1)
tree1.left = TreeNode.new(2)
tree1.right = TreeNode.new(3)

# Tree 2
#      1
#     / \
#    2   3
tree2 = TreeNode.new(1)
tree2.left = TreeNode.new(2)
tree2.right = TreeNode.new(3)

puts is_same_tree(tree1, tree2) # true

p "----------------------------------------"
# Tree 1
#      2
#     / \
#    1   3
tree1 = TreeNode.new(2)
tree1.left = TreeNode.new(1)
tree1.right = TreeNode.new(3)

# Tree 2
#      1
#     / \
#    2   3
tree2 = TreeNode.new(1)
tree2.left = TreeNode.new(2)
tree2.right = TreeNode.new(3)

puts is_same_tree(tree1, tree2) # true

p "----------------------------------------"
# Tree 1
#      2
#       \
#        3
tree1 = TreeNode.new(2)
tree1.right = TreeNode.new(3)

# Tree 2
#      1
#     /
#    2
tree2 = TreeNode.new(1)
tree2.left = TreeNode.new(2)

puts is_same_tree(tree1, tree2) # true
