# ruby arr_hsh/atm.rb

def atm(amount, denominations)
  denominations.each do |note|
    count = amount / note

    if count > 0
      puts "#{note} => #{count}"
      amount = amount % note
    end
  end
end

atm(385, [200, 100, 50, 20, 10, 5])
p "---------------------------------"
atm(110, [100, 20, 10, 5])
