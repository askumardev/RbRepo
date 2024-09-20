# Two Array Median: Given two sorted arrays nums1 and nums2 of size m and n respectively,
# return the median of the two sorted arrays. Must be O(m+n) or better.
# Eg: Input: nums1 = [1,2], nums2 = [3,4]
# Output: 2.50000
# Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
# num1 = [1,4,7]
# num2 = [2,3,4]
# num1 = [1,4,7]
# num2 = [2,3]

def median(arr1, arr2)
  return 0 if arr1.empty? && arr2.empty?
  index = 0
  median_array = []
  median = 0.0

  merged_array = arr1 + arr2
  merged_array = merged_array.sort
  p merged_array
  index = merged_array.size/2

  if merged_array.size.even?
    median_array = [merged_array[index - 1], merged_array[index]]
    median = (median_array.sum.to_f / 2)
    median
  else
    #p merged_array
    median = merged_array[index]
    median
  end
end

num1 = []
num2 = []
p median(num1, num2)

num1 = [1,4,7]
num2 = [2,3,4]
p median(num1, num2)

num1 = [1,4,7]
num2 = [2,3]
p median(num1, num2)


# class CsvReader
#   def call(input)
#     input.each do |i|
#     Student.create(fname: i[:fname], lname: i[:lname] )
#     end
#   end
# end


# class ExportController < ApplicationController
# include CsvReader
#   input   = File.read(params[:file])
#   reader = CsvReader.call(input)
# end


# class Student < ApplicationRecord
#   validate_presence_of :fname, :lname
# end

# ruby interview/josys.rb
