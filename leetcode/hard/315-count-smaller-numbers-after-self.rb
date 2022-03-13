# You are given an integer array nums and you have to return a new counts array. The counts array has the property where counts[i] is the number of smaller elements to the right of nums[i].

# Example:

# Input: [5,2,6,1]
# Output: [2,1,1,0] 
# Explanation:
# To the right of 5 there are 2 smaller elements (2 and 1).
# To the right of 2 there is only 1 smaller element (1).
# To the right of 6 there is 1 smaller element (1).
# To the right of 1 there is 0 smaller element.

def count_smaller(nums)
  index_to_num_hash = Hash.new(0)
  final_hash = {}
  
  nums.each_with_index do |num, i|
    index_to_num_hash[i] = num
    final_hash[i] ||= 0
    
    (0..i - 1).each do |j|
      if index_to_num_hash[j] > num
        final_hash[j] += 1
      end
    end
  end
  
  final_hash.values
end
