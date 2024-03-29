# ruby interview/fizzbuzz.rb

# (1..50).each do |x|
# 	m3 = x.modulo(3) == 0
# 	m5 = x.modulo(5) == 0

# 	puts case
# 		when (m3 and m5) then 'FizzBuzz'
# 		when m3 then 'Fizz'
# 		when m5 then 'Buzz'
# 		else x
# 	end
# end

# (1..15).each{|i|
#    x = ''
#    x += 'Fizz' if i%3==0
#    x += 'Buzz' if i%5==0
#   puts(x.empty? ? i : x);
# }

def hashed_fizz_buzz(num)
  hash = {}

  1.upto(num).each do |e|
    hash[e] = if (e % 5).zero? && (e % 3).zero?
                'FizzBuzz'
              elsif (e % 5).zero?
                'Buzz'
              elsif (e % 3).zero?
                'Fizz'
              else
                e
              end
  end

  puts hash
end
hashed_fizz_buzz 15

# def fizzbuzz(num)
#   1.upto(num).each do |x|
#     if x%3 == 0 && x%5 == 0
#       p "fizzbuzz"
#     elsif x % 5 == 0
#       p "buzz"
#     elsif x % 3 == 0
#       p "fizz"
#     else
#       p x
#     end
#   end
# end

# fizzbuzz(15)
