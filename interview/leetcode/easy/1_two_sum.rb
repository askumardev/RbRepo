#We have an array with elements [2,5,11,7,-2] and the target is 9.
# Get all pairs that add up to the target
# the output should be [[0, 3], [2, 4]], as both pairs (2, 7) and (11, -2) add up to 9.

# ruby leetcode/easy/1_two_sum.rb

#----------------------------------------
# Two Sum - Production / Interview Ready
#
# Handles:
# 1. Empty array
# 2. Single element array
# 3. Duplicate values
# 4. Negative numbers
# 5. Zero values
# 6. Nil elements
# 7. Non-numeric values
# 8. Multiple valid pairs (configurable)
# 9. Earliest pair preservation
# 10. No solution

############################################
# PROGRAM 1 : TWO SUM - PRINT INDICES
############################################

def two_sum_indices(arr, target)
  return nil if arr.nil? || arr.length < 2

  seen = {}

  arr.each_with_index do |num, index|
    complement = target - num

    return [seen[complement], index] if seen.key?(complement)

    seen[num] ||= index
  end

  nil
end

arr = [2, 11, 7, 5]
target = 9

puts "Array: #{arr.inspect}"
puts "Target: #{target}"
puts "Indices: #{two_sum_indices(arr, target).inspect}"

# Output:
# [0, 2]


############################################
# PROGRAM 2 : TWO SUM - PRINT NUMBERS
############################################

def two_sum_numbers(arr, target)
  return nil if arr.nil? || arr.length < 2

  seen = {}

  arr.each do |num|
    complement = target - num

    return [complement, num] if seen.key?(complement)

    seen[num] = true
  end

  nil
end

arr = [2, 11, 7, 5]
target = 9

puts "Array: #{arr.inspect}"
puts "Target: #{target}"
puts "Numbers: #{two_sum_numbers(arr, target).inspect}"

# Output:
# [2, 7]


# def two_sum(arr, target, return_all: false, return_format: :indices)
#   return nil if arr.nil? || arr.length < 2
#   return nil unless target.is_a?(Numeric)

#   seen = {}
#   result = []

#   arr.each_with_index do |num, index|
#     # Skip invalid elements
#     next unless num.is_a?(Numeric)

#     complement = target - num

#     if seen.key?(complement)
#       pair = if return_format == :indices
#         [seen[complement], index]
#       elsif return_format == :numbers
#         [arr[seen[complement]], num]
#       else
#         [seen[complement], index]
#       end

#       if return_all
#         result << pair
#       else
#         return pair
#       end
#     end

#     # Preserve earliest occurrence
#     seen[num] ||= index
#   end

#   return_all ? result : nil
# end

# ############################################
# # USER INPUT FOR OUTPUT FORMAT
# ############################################

# puts "Choose output format:"
# puts "1. Print Indices (e.g., [0, 3])"
# puts "2. Print Numbers (e.g., [2, 7])"
# print "Enter your choice (1 or 2): "
# choice = gets.chomp.to_i

# format = case choice
#          when 1
#            :indices
#          when 2
#            :numbers
#          else
#            puts "Invalid choice! Defaulting to indices."
#            :indices
#          end

# puts "\n" + "="*50
# puts "Output Format: #{format == :indices ? 'INDICES' : 'NUMBERS'}"
# puts "="*50 + "\n"

# ############################################
# # TEST CASES
# ############################################

# tests = [
#   {
#     description: "Normal case",
#     arr: [2, 11, 7, 5],
#     target: 9
#   },

#   {
#     description: "Empty array",
#     arr: [],
#     target: 9
#   },

#   {
#     description: "Single element",
#     arr: [5],
#     target: 10
#   },

#   {
#     description: "Duplicate numbers",
#     arr: [3, 3],
#     target: 6
#   },

#   {
#     description: "No solution",
#     arr: [1, 2, 3, 4],
#     target: 100
#   },

#   {
#     description: "Negative numbers",
#     arr: [-1, -2, -3, -4],
#     target: -5
#   },

#   {
#     description: "Zeros",
#     arr: [0, 4, 3, 0],
#     target: 0
#   },

#   {
#     description: "Repeated values",
#     arr: [1, 1, 1, 8],
#     target: 9
#   },

#   {
#     description: "Nil element present",
#     arr: [2, nil, 7],
#     target: 9
#   },

#   {
#     description: "Non-numeric element",
#     arr: [2, "abc", 7],
#     target: 9
#   },

#   {
#     description: "Multiple pairs",
#     arr: [1, 8, 2, 7, 3, 6],
#     target: 9
#   },
#   {
#     description: "Non-numeric target ",
#     arr: [2, "abc", 7],
#     target: "a"
#   },
# ]

# tests.each do |test|
#   puts "\n#{test[:description]}"
#   puts "Array: #{test[:arr].inspect}, Target: #{test[:target]}"
#   p two_sum(test[:arr], test[:target], return_format: format)
# end

# ############################################
# # Return ALL pairs
# ############################################

# puts "\n" + "="*50
# puts "All pairs (#{format == :indices ? 'INDICES' : 'NUMBERS'}):"
# puts "="*50
# p two_sum([1, 8, 2, 7, 3, 6], 9, return_all: true, return_format: format)
