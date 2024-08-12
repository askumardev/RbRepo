# ruby interview/dictionary.rb

def valid_sentence(str, dictionary)
  hash = {}
  dictionary.each { |w| hash[w.downcase] = true }
  p hash
  words_arr = str[0..-2].downcase.split(' ')
  p words_arr
  words_arr.each do |e|
    return false unless hash[e]
  end
  true
end

str = 'Practice makes perfect.'
dictionary = %w[practice perfect makes]
puts valid_sentence(str, dictionary) == true
p "--------------------------------"
str = 'Practice makes perfect.'
dictionary = %w[practice perfect]
puts valid_sentence(str, dictionary) == false
