# ruby basics/ancestors_superclass.rb


class Samp
  def sample
    puts "sample data"
  end
end

s = Samp.new
s.sample
p "--------------------"
puts Samp.ancestors
p "--------------------"
puts s.class.ancestors