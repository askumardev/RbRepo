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

def two_sum(arr, target, return_all: false)
  return nil if arr.nil? || arr.length < 2
  return nil unless target.is_a?(Numeric)

  seen = {}
  result = []

  arr.each_with_index do |num, index|
    # Skip invalid elements
    next unless num.is_a?(Numeric)

    complement = target - num

    if seen.key?(complement)
      pair = [seen[complement], index]

      if return_all
        result << pair
      else
        return pair
      end
    end

    # Preserve earliest occurrence
    seen[num] ||= index
  end

  return_all ? result : nil
end

############################################
# TEST CASES
############################################

tests = [
  {
    description: "Normal case",
    arr: [2, 11, 7, 5],
    target: 9
  },

  {
    description: "Empty array",
    arr: [],
    target: 9
  },

  {
    description: "Single element",
    arr: [5],
    target: 10
  },

  {
    description: "Duplicate numbers",
    arr: [3, 3],
    target: 6
  },

  {
    description: "No solution",
    arr: [1, 2, 3, 4],
    target: 100
  },

  {
    description: "Negative numbers",
    arr: [-1, -2, -3, -4],
    target: -5
  },

  {
    description: "Zeros",
    arr: [0, 4, 3, 0],
    target: 0
  },

  {
    description: "Repeated values",
    arr: [1, 1, 1, 8],
    target: 9
  },

  {
    description: "Nil element present",
    arr: [2, nil, 7],
    target: 9
  },

  {
    description: "Non-numeric element",
    arr: [2, "abc", 7],
    target: 9
  },

  {
    description: "Multiple pairs",
    arr: [1, 8, 2, 7, 3, 6],
    target: 9
  },
  {
    description: "Non-numeric target ",
    arr: [2, "abc", 7],
    target: "a"
  },
]

tests.each do |test|
  puts "\n#{test[:description]}"
  p two_sum(test[:arr], test[:target])
end

############################################
# Return ALL pairs
############################################

puts "\nAll pairs:"
p two_sum([1, 8, 2, 7, 3, 6], 9, return_all: true)
