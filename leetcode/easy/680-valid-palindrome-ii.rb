# Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

# Example 1:
# Input: "aba"
# Output: True
# Example 2:
# Input: "abca"
# Output: True
# Explanation: You could delete the character 'c'.
# Note:
# The string will only contain lowercase characters a-z. The maximum length of the string is 50000.

def valid_palindrome(s)
  return true if s == s.reverse
  
  (0..(s.size / 2) - 1).each do |i|  
    if s[i] != s[s.size - i - 1]
      temp = s
      temp2 = s.reverse
      
      temp[i] = '' 
      temp2[i] = ''
      
      if is_palindrome(temp) || is_palindrome(temp2)
        return true
      else
        return false
      end    
    end
  end
end

def is_palindrome(str)
  str == str.reverse
end