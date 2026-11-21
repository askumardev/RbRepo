# ruby leetcode/easy/204-count-primes.rb

# Count the number of prime numbers less than a non-negative number, n.

# Example:

# Input: 10
# Output: 4
# Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.

def count_primes(n)
  return 0 if n == 0 || n == 1 || n == 2 
  
  count = 0
  
  (2..n - 1).each do |num|  
    count += 1 if is_prime(num)
  end
  
  count
end

def is_prime(n)
  (2..Math.sqrt(n)).each do |num|
    return false if n % num == 0
  end
  
  true
end

p count_primes(10)