# ruby leetcode/easy/344-reverse-string.rb

# Write a function that reverses a string. The input string is given as an array of characters char[].

# Do not allocate extra space for another array, you must do this by modifying the input array in-place 
# with O(1) extra memory.

# You may assume all the characters consist of printable ascii characters.
# Example 1:
# Input: ["h","e","l","l","o"]
# Output: ["o","l","l","e","h"]

# Example 2:
# Input: ["H","a","n","n","a","h"]
# Output: ["h","a","n","n","a","H"]

def reverse_string(s)
  (0..(s.size / 2 - 1)).each do |index|
    temp = s[s.size - index - 1]
    
    s[s.size - index - 1] = s[index]
    s[index] = temp
  end
  
  s
end