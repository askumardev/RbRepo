def fizbuz(n)
    hash=Hash.new
    1.upto(n).each do |x|
        if(x%15==0)
            hash[x] = "fizzbuzz"
        elsif(x%3==0)
            hash[x] = "fizz"
        elsif(x%5==0)
            hash[x] = "buzz"
        else
            hash[x] = x
        end
    end
    puts hash
end

fizbuz(15)