def find_dup_uniq(arr)
  uniq_arr = []
  dup = []
  hsh = arr.map{|x| [x,arr.count(x)]}.to_h
  p hsh
  p "----------Duplicate elements----------"
  hsh.map{|k,v| dup << k if v > 1}
  p dup
  p "----------unique elements----------"
  hsh.keys.map{|k| uniq_arr << k}
  p uniq_arr
end

arr = [1,2,2,3,3,3,4,4,4,4,5]
find_dup_uniq(arr)