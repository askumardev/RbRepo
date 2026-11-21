# ruby leetcode/easy/367-valid-perfect-square.rb

# Given a positive integer num, write a function which returns True if num is a perfect square else False.

# Follow up: Do not use any built-in library function such as sqrt.

# Example 1:
# Input: num = 16
# Output: true

# Example 2:
# Input: num = 14
# Output: false

# Constraints:

# 1 <= num <= 2^31 - 1

def is_perfect_square(num)
  i = 1

  loop do
    square_num = i ** 2

    if square_num == num
        return true
    elsif square_num > num
        return false
    end

    i += 1
  end
end

p is_perfect_square(9)
p is_perfect_square(8)



You could write the same logic more clearly as:

def is_perfect_squaree(num)
  i = 1

  while i * i <= num
    return true if i * i == num
    i += 1
  end

  false
end

p is_perfect_squaree(9)
p is_perfect_squaree(8)
