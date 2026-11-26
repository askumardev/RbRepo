SELECT p.*
FROM parts p
LEFT JOIN fittings f
    ON p.id = f.part_id
WHERE f.part_id IS NULL;


possible binary search trees if a value n is provided

def num_trees(n)
  dp = Array.new(n + 1, 0)

  dp[0] = 1
  dp[1] = 1

  (2..n).each do |nodes|
    (1..nodes).each do |root|
      dp[nodes] += dp[root - 1] * dp[nodes - root]
    end
  end

  dp[n]
end

p num_trees(3) # 5
p num_trees(4) # 14
p num_trees(5) # 42
p "============================="
Approach 1: Catalan formula (simplest)
Instead of maintaining a DP array, calculate the Catalan number directly.
\[
C_n = \frac{(2n)!}{(n+1)! \cdot n!}
\]

Ruby implementation:
def factorial(n)
  (1..n).reduce(1, :*)
end

def num_trees(n)
  factorial(2 * n) / (factorial(n + 1) * factorial(n))
end

puts num_trees(3) # 5
puts num_trees(4) # 14
puts num_trees(5) # 42


p "-------------------"


def calculate_cashback(transactions, validity)
  balance = 0

  transactions.each do |day, amount|
    next if amount <= 0

    expiry_day = day + validity - 1

    balance += amount if day <= expiry_day
  end

  balance
end

transactions = [[1, 100], [3, -100]]

puts calculate_cashback(transactions, 1)
