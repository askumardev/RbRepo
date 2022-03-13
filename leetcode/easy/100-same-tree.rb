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

def is_same_tree(p, q)
  @same = true
    
  traverse(p, q)
  
  @same
end

def traverse(p, q)
  if p.nil? || q.nil?
    if !(p.nil? && q.nil?)
      @same = false
    end
    
    return
  end

  if p.val != q.val
    @same = false 
    return
  end

  traverse(p.right, q.right)
  traverse(p.left, q.left)
end