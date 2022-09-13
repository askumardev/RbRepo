# ruby adv/ranks.rb

def solution(ranks)
  rank = []
  hsh = ranks.group_by(&:itself).transform_values(&:count)
  puts hsh
  hsh.each do |key, _value|
    puts key.to_s
  end

  5
end
ranks_arr = [3, 4, 3, 0, 2, 2, 3, 0, 0]
#   ranks_arr1= [4, 4, 3, 3, 1, 0]
# ranks_arr2= [4, 2, 0]
solution(ranks_arr)

# hash = { 'key1' => 'val1', 'key2' => 'val2' }
# string = ''
# hash.each { |k, v| string << k << v << "\n" }
# puts "#{hash.keys.join("\n")}\n"
# puts string
