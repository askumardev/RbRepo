class Factorial
  def factorial_of(n)
    (1..n).inject(:*)
  end
end