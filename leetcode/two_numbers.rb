def two_sum(nums, target)
  compared = {}
  nums.each_with_index do |num, i|
    reminder = target - num
    return [compared[reminder], i] if compared[reminder]
    compared[num] = i
  end
end

p two_sum([3,2,4], 7)

# ruby leetcode/two_numbers.rb