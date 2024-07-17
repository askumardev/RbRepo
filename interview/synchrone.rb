# ruby interview/synchrone.rb

def longest_substring_without_repeating(s)
  n = s.length
  max_length = 0
  start = 0
  last_seen = {}
  longest_substring = ""

  (0...n).each do |i|
    p [i, s[i], start]
    if last_seen.key?(s[i]) && last_seen[s[i]] >= start
      p "=========first if======"
      p last_seen.key?(s[i])
      p last_seen[s[i]]
      
      start = last_seen[s[i]] + 1
      p start
    end

    last_seen[s[i]] = i
    p last_seen
    current_substring = s[start..i]
    p current_substring
    if current_substring.length > longest_substring.length
      p "-------second if-----------"
      p current_substring
      p longest_substring
      longest_substring = current_substring
      p longest_substring
    end
    p "------end of iteration #{i}-----"
  end

  longest_substring
end

# Example usage:
string = "abcaaadefdgdhijkl"
longest_substring = longest_substring_without_repeating(string)
puts "Longest substring without repeating characters: #{longest_substring}"



# def longest_substrings_without_repeating(s)
#   result = 0
#   hash = {}
#   j = 0
#   substrings = []

#   for i in 0...s.length
#     if hash.has_key?(s[i])
#       p hash
#       p s[i]
#       j = [hash[s[i]] + 1, j].max
#       p j
#     end
#     current_length = i - j + 1
#     if current_length > result
#       result = current_length
#       substrings = [s[j..i]]
#     elsif current_length == result
#       substrings << s[j..i]
#     end
#     hash[s[i]] = i
#   end

#   return result, substrings
# end

# # Example usage:
# string = "abcaaadefdgdhijkl"
# length, substrings = longest_substrings_without_repeating(string)
# puts "Length of the longest substrings without repeating characters: #{length}"
# puts "Longest substrings without repeating characters: #{substrings}"