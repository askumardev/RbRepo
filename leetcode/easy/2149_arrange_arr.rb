# ruby leetcode/easy/2149_arrange_arr.rb

def rearrange_array(nums)
  result = Array.new(nums.length)

  positive_index = 0
  negative_index = 1

  nums.each do |num|
    if num > 0
      result[positive_index] = num
      positive_index += 2
    else
      result[negative_index] = num
      negative_index += 2
    end
  end

  result
end


nums = [3, 1, -2, -5, 2, -4]
p rearrange_array(nums)
