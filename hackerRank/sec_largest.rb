# ruby hackerRank/sec_largest.rb

def second_largest(arr)
  largest = second = -Float::INFINITY

  arr.each do |n|
    if n > largest
      second = largest
      largest = n
    elsif n > second && n != largest
      second = n
    end
  end

  second == -Float::INFINITY ? nil : second
end

puts second_largest([10, 5, 8, 20, 15])  # => 15
puts second_largest([5, 5, 5])           # => nil (no true second largest)
