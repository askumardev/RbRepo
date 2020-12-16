# frozen_string_literal: true

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# #arr.each { |number| puts number if number > 5}
# arr.select{|n| puts n if n >5}

def front_back(txt)
  txt[-1] << txt[1...-1] << txt[0]
  puts txt[0]
  puts txt[1..-1]
  puts txt[-1]
  txt[-1] << txt[1...-1] << txt[0]
end
print front_back('Python'), "\n"
print front_back('Java'), "\n"
