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



# @param {String} pattern
# @param {String} str
# @return {Boolean}
def word_pattern(pattern, str)
  pattern = pattern.chars
  str = str.split(' ')
 if pattern.size != str.size
  puts("F")
   return false 
 end

  p2s, s2p = {}, {}
  pattern.zip(str) do |p, s|
    return false if p2s.key?(p) && p2s[p] != s
    return false if s2p.key?(s) && s2p[s] != p
    p2s[p], s2p[s] = s, p
  end
  puts("T")
  return true
end

word_pattern("abba", "dog cat cat cat")

word_pattern("abba", "dog cat cat fish cow")