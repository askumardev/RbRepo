# ruby hackerRank/simple_arr_sum.rb

require 'json'
require 'stringio'

#
# Complete the 'simpleArraySum' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY ar as parameter.
#

def simpleArraySum(ar)
  return "array size should be greater than zero" if ar.size == 0

  sum = 0
  ar.each do |a|
    if a <= 1000
      sum += a
    else
      puts "given value is greater than 1000"
    end
  end
  sum
end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')
# ar_count = gets.strip.to_i
# ar = gets.rstrip.split.map(&:to_i)
ar = [1, 2, 3, 4, 10, 11]
p ar
result = simpleArraySum ar
p result
# fptr.write result
# fptr.write "\n"

# fptr.close()
