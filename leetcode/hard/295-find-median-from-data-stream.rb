# Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.

# For example,
# [2,3,4], the median is 3

# [2,3], the median is (2 + 3) / 2 = 2.5

# Design a data structure that supports the following two operations:

# void addNum(int num) - Add a integer number from the data stream to the data structure.
# double findMedian() - Return the median of all elements so far.
 

# Example:

# addNum(1)
# addNum(2)
# findMedian() -> 1.5
# addNum(3) 
# findMedian() -> 2

class MedianFinder
=begin
    initialize your data structure here.
=end
  def initialize()
    @nums_array = []
  end
=begin
    :type num: Integer
    :rtype: Void
=end
def add_num(num)
  @nums_array << num
  @nums_array = @nums_array.sort
end
=begin
    :rtype: Float
=end
  def find_median()
    size = @nums_array.size
    return_val = nil
    
    if size % 2 == 1
      return_val =  @nums_array[(size / 2)] * 1.0
    else
      num1 = @nums_array[(size / 2)]
      num2 = @nums_array[(size / 2) - 1]
      
      return_val = (num1 + num2) / 2.0
    end

    return_val
  end
end

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()
 