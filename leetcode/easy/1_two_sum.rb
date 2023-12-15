#We have an array with elements [2,5,11,7,-2] and the target is 9. 
# Get all pairs that add up to the target
# the output should be [[0, 3], [2, 4]], as both pairs (2, 7) and (11, -2) add up to 9.

# ruby leetcode/easy/1_two_sum.rb

def two_sum_indices(nums, target)
  num_indices = {}
  result = []

  nums.each_with_index do |num, index|
    complement = target - num

    if num_indices.key?(complement)
      result << [num_indices[complement], index]
    end

    num_indices[num] = index
  end

  return result
end

# Example usage
nums = [2, 5, 11, 7, -2]
target = 9
result = two_sum_indices(nums, target)

if result.empty?
  puts "No such pairs found."
else
  puts "Indices of the pairs: #{result}"
end



#Explaination

# The approach you're using, often called the "two-pointer technique" with a hash table, is already quite 
# efficient with a time complexity of O(n) where n is the size of the array. It's one of the most 
# optimal ways to solve this problem.

# If you're looking for alternative methods, you could use nested loops, but the time complexity would be O(n^2), 
# which is less efficient. Here's an example of the nested loop approach:

# # another solution
# def two_sum_indices_bruteforce(nums, target)
#   result = []

#   (0..nums.length - 2).each do |i|
#     ((i + 1)..nums.length - 1).each do |j|
#       if nums[i] + nums[j] == target
#         result << [i, j]
#       end
#     end
#   end

#   return result
# end

# # Example usage
# nums = [2, 5, 11, 7, -2]
# target = 9
# result_bruteforce = two_sum_indices_bruteforce(nums, target)

# if result_bruteforce.empty?
#   puts "No such pairs found (bruteforce)."
# else
#   puts "Indices of the pairs (bruteforce): #{result_bruteforce}"
# end

# However, as mentioned, the nested loop approach is less efficient, especially for large arrays. 
# Stick with the original solution using a hash table, as it is more optimal.