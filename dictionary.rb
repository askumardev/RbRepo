def valid_sentence(str, dictionary)
    hash={}
    dictionary.each{|w| hash[w] = true}
    #puts dictionary
    words_arr = str[0..str.length-2].split("")
    words_arr.each do |e|
        return false if !hash[e.downcase]
    end
    true
   
end

str="Practice makes perfect."
dictionary = ["practice","perfect","makes"]
puts valid_sentence(str,dictionary) == true

str="Practice makes perfect."
dictionary = ["practice","perfect"]
puts valid_sentence(str,dictionary) == false