# ruby basics/loops/throw_catch.rb

catch (:my_label) do
  puts "This is before the catch block."

  3.times do |i|
    puts "Iteration #{i}"
    
    if i == 1
      throw :my_label
    end
  end

  puts "This is after the catch block."
end

puts "This is after the catch block and the catch label."
