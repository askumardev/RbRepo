# ruby interview/Fibo.rb

def fibonacci(n)
  if n <= 1 then
    return n
  end
  return fibonacci(n - 1) + fibonacci(n - 2)
end

def fibonacci(n)
  first = 0
  second = 1
  temp = 0
  if n == 0 then
    return first
  elsif n == 1 then
    return second
  end
  i = 2
  while i <= n
    temp = first + second
    first = second
    second = temp
    i += 1
  end
  return temp
end

def fibo(n)
  (1..n).inject([0,1]){|fib| fib << fib.last(2).sum}
end

# Testing code
print fibo(10)
puts("-----Fibonacci series using inject--------")
puts fibonacci(10)#print sum