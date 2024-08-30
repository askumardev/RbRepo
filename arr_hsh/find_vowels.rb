# ruby arr_hsh/find_vowels.rb

str = "ggggrrreeeeeeaaaaaaatttttttttttttt"
vowel_arr = %w(a e i o u)
arr = str.chars
hsh = arr.map{|x| [x,arr.count(x)]}.to_h
p hsh
p "-------consonents are-------------"
p hsh.keys.select{|x| !vowel_arr.include?(x)}

p "-------vowels are-------------"
p hsh.keys.select{|x| vowel_arr.include?(x)}

p "-------vowels count-------------"
p hsh.select { |k, v| vowel_arr.include?(k) }

p "-------consonents count-------------"
p hsh.select { |k, v| !vowel_arr.include?(k) }
