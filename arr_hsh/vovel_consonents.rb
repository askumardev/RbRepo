# ruby arr_hsh/vowel_consonents.rb

str = "satish Kumar"
arr = str.chars
vowel_arr = %w(a e i o u)
vowels = []
consonents = []
p arr
arr.each do |x|
  vowels << x if vowel_arr.include?(x)
  consonents << x unless vowel_arr.include?(x)
end
p vowels
p vowels.count
consonents = consonents.select { |element| element != " " }
p consonents
p consonents.count