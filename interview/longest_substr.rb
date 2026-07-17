# ruby interview/longest_substr.rb

def longest_unique_substring(str)
  start = 0
  longest = ''
  seen = {}

  str.chars.each_with_index do |char, i|
    if seen[char] && seen[char] >= start
      start = seen[char] + 1
    end
    seen[char] = i
    current = str[start..i]
    longest = current if current.length > longest.length
  end

  longest
end

string = "abcaaadefdgdhijkl"
puts longest_unique_substring(string)
# => "defdgdhijkl"... let's check: actually => "cdefdgdhijkl"?