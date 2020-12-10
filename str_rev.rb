def reverse_string(string)
    
    split_string = string.split("")
    reversed = []
    string.size.times { reversed << split_string.pop }
    puts reversed.join
    #reversed.join
end
puts reverse_string("hello")