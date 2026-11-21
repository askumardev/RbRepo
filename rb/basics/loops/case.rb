# ruby basics/loops/case.rb

def size_description(size)
  case size
  when 1..10
    "Small"
  when 11..20
    "Medium"
  when 21..30
    "Large"
  else
    "Extra Large"
  end
end
  
puts size_description(5)   # Output: "Small"
puts size_description(15)  # Output: "Medium"
puts size_description(25)  # Output: "Large"
puts size_description(35)  # Output: "Extra Large"