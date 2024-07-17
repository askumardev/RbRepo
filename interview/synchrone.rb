# ruby interview/synchrone.rb

def longest_substring_without_repeating(s)
  n = s.length
  max_length = 0
  start = 0
  last_seen = {}
  longest_substring = ""

  (0...n).each do |end_idx|
    if last_seen.key?(s[end_idx]) && last_seen[s[end_idx]] >= start
      start = last_seen[s[end_idx]] + 1
    end

    last_seen[s[end_idx]] = end_idx
    current_substring = s[start..end_idx]
    if current_substring.length > longest_substring.length
      longest_substring = current_substring
    end
  end

  longest_substring
end

# Example usage:
string = "abcaaadefdgdhijkl"
longest_substring = longest_substring_without_repeating(string)
puts "Longest substring without repeating characters: #{longest_substring}"
