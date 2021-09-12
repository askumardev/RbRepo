class Array
  def filter_even
    select{|x| x%2==0}
  end
  def multiply_ten
    map{|x| x *10}
  end
end

input = Array.new([1,2,3,4,5,6,7,8,9,10])
puts input.filter_even.multiply_ten