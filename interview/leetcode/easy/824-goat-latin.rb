# ruby leetcode/easy/824-goat-latin.rb

# A sentence S is given, composed of words separated by spaces. Each word consists of
# lowercase and uppercase letters only.

# We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)
# The rules of Goat Latin are as follows:

# If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
# For example, the word 'apple' becomes 'applema'.

# If a word begins with a consonant (i.e. not a vowel), remove the first letter and append
# it to the end, then add "ma".
# For example, the word "goat" becomes "oatgma".

# Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
# For example, the first word gets "a" added to the end, the second word gets "aa" added to
# the end and so on.
# Return the final sentence representing the conversion from S to Goat Latin.

# Example 1:
# Input: "I speak Goat Latin"
# Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
# Example 2:

# Input: "The quick brown fox jumped over the lazy dog"
# Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa
# azylmaaaaaaaaa ogdmaaaaaaaaaa"

# Notes:

# S contains only uppercase, lowercase and spaces. Exactly one space between each word.
# 1 <= S.length <= 150.

def to_goat_latin(s)
  s = s.split(' ')

  vowels = [
    'a', 'e', 'i', 'o', 'u',
    'A', 'E', 'I', 'O', 'U'
  ]

  s.each_with_index do |str, index|
    if !vowels.include?(str[0])
      str << str[0]

      str = str.split('')
      str.shift
      str = str.join('')
    end

    str << 'ma'

    str = str + ('a' * (index + 1))

    s[index] = str
  end

  s.join(' ')
end

# Test cases to print the results
puts to_goat_latin("I speak Goat Latin")
puts to_goat_latin("The quick brown fox jumped over the lazy dog")


# def to_goat_latin(s)
#   vowels = %w[a e i o u A E I O U]

#   s.split(' ').map.with_index(1) do |word, index|
#     if vowels.include?(word[0])
#       transformed = word
#     else
#       transformed = word[1..-1] + word[0]
#     end

#     transformed + 'ma' + ('a' * index)
#   end.join(' ')
# end

# # Test cases to print the results
# puts to_goat_latin("I speak Goat Latin")
# puts to_goat_latin("The quick brown fox jumped over the lazy dog")
