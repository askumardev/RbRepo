def get_count(str_or_arr)
  arr = []
  counts = Hash.new(0)
  if str_or_arr.is_a?(String)
    arr = str_or_arr.chars
  else
    arr = str_or_arr
  end
  # p arr
  # hsh = arr.map{|x| [x,arr.count(x)]}.to_h
  # p hsh
  arr.each do |x|
    counts[x] += 1
  end
  p counts
end


str_or_arr = "ggrrrrreeeeaaaaattttttttttt"
get_count(str_or_arr)
str_or_arr = [1,2,2,3,3,3,4,4,4,4,5]
get_count(str_or_arr)

# ruby arr_hsh/get_count.rb
