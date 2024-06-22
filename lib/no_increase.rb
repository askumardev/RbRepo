require 'pry'
def number_of_increases(input)
  # binding.pry
  input.each_cons(2).inject(0) do |count, (x, y)|
    if x < y
      count + 1
    else
      count
    end
  end
end

def windows(n, input)
  input.each_cons(3).map(&:sum)
end

if __FILE__ == $0
  input = File.readlines(ARGV.first).map(&:to_i)
  p input
  p '############################'
  p number_of_increases(input)
  p '############################'
  p number_of_increases(windows(3, input))
end