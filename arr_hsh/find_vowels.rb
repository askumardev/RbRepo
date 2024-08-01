# ruby arr_hsh/find_vowels.rb

str = "ggggrrreeeeeeaaaaaaatttttttttttttt"
vowel_arr = %w(a e i o u)

arr = str.chars
hsh = arr.map{|x| [x,arr.count(x)]}.to_h
p hsh
p hsh.keys.select{|x| vowel_arr.include?(x)}
