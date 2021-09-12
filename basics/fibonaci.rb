# frozen_string_literal: true

# def fibonacci( n )
#     return  n  if n <= 1
#     fibonacci( n - 1 ) + fibonacci( n - 2 )
# end
# puts fibonacci( 10 )

def fibonacci(n)
  n <= 1 ? n : fibonacci(n - 1) + fibonacci(n - 2)
end
puts fibonacci(15)
