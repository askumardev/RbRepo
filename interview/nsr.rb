def is_annkissam(str)
  nouns = ['abcd', 'c', 'def', 'h', 'ij', 'cde']
  verbs = ['bc', 'fg', 'g', 'hij', 'bcd']
  articles = ['a', 'ac', 'e']
  array_words = str.split(' ')
  number_of_nouns, number_of_verbs, number_of_articles = 0, 0, 0
  valid_sentence = false
  array_words.each do |word|
    number_of_nouns += 1 if nouns.include?(word)
    number_of_verbs += 1 if verbs.include?(word)
    number_of_articles += 1 if articles.include?(word)
  end
  valid_sentence = true if (number_of_verbs >= 1 && (number_of_nouns >= 1 || number_of_articles >= 2) && ( (number_of_nouns + number_of_verbs + number_of_articles) == array_words.size ))
  return valid_sentence
end
def get_combinations(str_arr)  
  str_combo = '' 
  str_arr.each do |x|
    break if x == ''  
    str_combo += x
  end
  return str_combo 
end
def get_patterns(input_str, str, i, j, n)  
  if i == n  
    str[j] = ''
    $possibilities << get_combinations(str) 
    return
  end
  str[j] = input_str[i] 
  get_patterns(input_str, str, i+1, j+1, n) 
  str[j] = ' '
  str[j+1] = input_str[i] 
  get_patterns(input_str, str, i+1, j+2, n) 
end
def generate_all_possibilities(input_str)  
  n = input_str.length
  str = [0] * (2*n) 
  str[0] = input_str[0] 
  get_patterns(input_str, str, 1, 1, n) 
end
def get_all_elements(possibilities)
  output = []
  possibilities.each do |a|
    output << a if is_annkissam(a)
  end
  return output
end
input_str = "abcd"
$possibilities = []
generate_all_possibilities(input_str)
result = get_all_elements($possibilities)
puts result.inspect
