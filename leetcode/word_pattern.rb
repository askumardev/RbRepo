# ruby leetcode/word_pattern.rb

# Given a pattern and a string str, find if str follows the same pattern.
#
# Examples:
#
#     + pattern = "abba", str = "dog cat cat dog" should return true.
#     + pattern = "abba", str = "dog cat cat fish" should return false.
#     + pattern = "aaaa", str = "dog cat cat dog" should return false.
#     + pattern = "abba", str = "dog dog dog dog" should return false.
#
# Notes:
#
#     + Both pattern and str contains only lowercase alphabetical letters.
#     + Both pattern and str do not have leading or trailing spaces.
#     + Each word in str is separated by a single space.
#     + Each letter in pattern must map to a word with length that is at
#       least 1.

def word_pattern(pattern, str)
  pattern = pattern.chars
  words = str.split(' ')

  if pattern.size != words.size
    puts "F"
    return false
  end

  p2s, s2p = {}, {}

  pattern.zip(words) do |p, w|
    if (p2s[p] && p2s[p] != w) || (s2p[w] && s2p[w] != p)
      puts "F"
      return false
    end

    p2s[p] = w
    s2p[w] = p
  end

  puts "T"
  true
end

word_pattern("abba", "dog cat cat dog")   # T
word_pattern("abba", "dog cat cat fish")  # F
word_pattern("aaaa", "dog dog dog dog")   # T
word_pattern("abba", "dog dog dog dog")   # F
