# ruby adv/missing_seq.rb

def find_missing_number(arr)
  # Step 1: Determine the common difference (assuming it's a constant arithmetic sequence)
  common_difference = arr[1] - arr[0]

  # Step 2: Calculate the expected sum of the full sequence
  n = arr.length + 1
  first_term = arr[0]
  last_term = arr[-1]
  expected_sum = (n * (first_term + last_term)) / 2

  # Step 3: Calculate the actual sum of the array
  actual_sum = arr.sum

  # Step 4: Find the missing number
  missing_number = expected_sum - actual_sum

  missing_number
end

# Example usage
arr = [2, 4, 6, 10]
missing_number = find_missing_number(arr)
puts "The missing number is #{missing_number}"



# def find_missing(sequence)
#   consecutive     = sequence.each_cons(2)
#   p consecutive
#   differences     = consecutive.map { |a,b| b - a }
#   p differences
#   sequence        = differences.max_by { |n| differences.count(n) }
#   p sequence
#   missing_between = consecutive.find { |a,b| (b - a) != sequence }
#   p missing_between
#   puts missing_between.first + sequence
# end
# find_missing([2,4,6,10])
