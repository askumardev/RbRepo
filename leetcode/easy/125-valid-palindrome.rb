# ruby leetcode/easy/125-valid-palindrome.rb

# Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

# Note: For the purpose of this problem, we define empty string as valid palindrome.

# Example 1:
# Input: "A man, a plan, a canal: Panama"
# Output: true

# Example 2:
# Input: "race a car"
# Output: false


def is_palindrome(s)
  cleaned = s.downcase.gsub(/[^a-z0-9]/, "")
  # cleaned = s.downcase.gsub(/[,: ]/, "")
  puts "checking for the string -> #{cleaned}"

  left = 0
  right = cleaned.length - 1

  while left < right
    # p "#{left} -- #{cleaned[left]}"
    # p "#{right} -- #{cleaned[right]}"
    return false if cleaned[left] != cleaned[right]

    left += 1
    right -= 1
  end

  true
end

cases = {
  "race a car" => false,
  "A man, a plan, a canal: Panama" => true,
  "" => true,
  ".," => true,
  "a." => true,
  "0P" => false,
  "Able was I, ere I saw Elba" => true,
  "No lemon, no melon" => true,
  "12321" => true,
  "12 3 21" => true,
  "1a2" => false,
  "Malayalam" => true
}

cases.each do |input, expected|
  result = is_palindrome(input)
  puts "#{input.inspect} => #{result} (expected #{expected})"
  p "-------------------------------------------------------"
end


# def is_palindrome(s)
#   s.gsub!(/\W/,'')
#   sdown = s.downcase
#   p sdown
#   p s.reverse

#   sdown == s.reverse
# end

# p is_palindrome("race a car")
# p "----------------------------------------------"
# p is_palindrome("A man, a plan, a canal: Panama")
