# Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
# In Pascal's triangle, each number is the sum of the two numbers directly above it.
# Example:

# Input: 5
# Output:
# [
#      [1],
#     [1,1],
#    [1,2,1],
#   [1,3,3,1],
#  [1,4,6,4,1]
# ]

def generate(num_rows)
  return [] if num_rows == 0
  
  rows = [[1]]
  
  return rows if num_rows == 1
  
  (2..num_rows).each do |index|
    array = []
    
    (0..index - 1).each do |checker|
      if checker == 0 || checker == index - 1
        array << 1 
      else
        array << rows.last[checker] + rows.last[checker - 1]
      end
    end
    
    rows << array
  end
  
  rows
end
