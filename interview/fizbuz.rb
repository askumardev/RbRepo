# ruby interview/fizbuz.rb

def fizbuz(n)
  hash = {}
  1.upto(n).each do |x|
    hash[x] = if (x % 15).zero?
                'fizzbuzz'
              elsif (x % 3).zero?
                'fizz'
              elsif (x % 5).zero?
                'buzz'
              else
                x
              end
  end
  puts hash
end

fizbuz(15)
