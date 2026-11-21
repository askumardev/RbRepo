# ruby arr_hsh/anagram.rb

def anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

# Example usage
puts anagram?('listen', 'silent')  # true
puts anagram?('hello', 'world')    # false