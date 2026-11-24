# ruby interview/hackerRank/sec_largest.rb  # Command used to run this Ruby program

def second_largest(arr)
  largest = arr[0]
  second_largest = nil

  arr.each do |num|
    if num > largest  # Checks whether the current number is greater than the largest
      second_largest = largest  # Moves the old largest value into the second-largest position
      largest = num  # Updates the largest value to the current number
    elsif num < largest  # Checks whether the current number is smaller than the largest
      if second_largest.nil? || num > second_largest  # Uses the number if no second-largest exists or it is larger
        second_largest = num  # Stores the current number as the new second-largest value
      end
    end
  end

  second_largest  # Returns the second-largest value, or nil when no distinct value exists
end

puts second_largest([10, 20, 5, 8, 30, 25])  # Prints 25 as the second-largest distinct value
puts second_largest([10, 5, 8, 20, 15])  # Prints 15 as the second-largest distinct value
puts second_largest([5, 5, 5])  # Prints nil because every value is equal
