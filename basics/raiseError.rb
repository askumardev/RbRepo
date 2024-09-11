=begin 
    Ruby program to demonstrate use of raise statement 
=end  

puts "Use of Raise statement. Exception Raised"

begin
  a = 50
  b = 0
  raise ZeroDivisionError.new "the value of b should not be 0" if b == 0
  print "a/b = ", (a / b)
  rescue ZeroDivisionError => e
    puts e.message
    puts e.backtrace
end
