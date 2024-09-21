def print_num
  yield "1"
  yield "2"
  yield "3"
  end
  print_num { |num| puts "Printing #{num}" 
}


  # ruby adv/yieldemo.rb