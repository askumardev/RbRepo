hsh = {'Input.txt' => 'Randy', 'Code.py' => 'Stan', 'Output.txt' => 'Randy'}
# h = Hash.new{ |hash, key| hash[key] = [] }
# p hsh.each_with_object(h) {|(k,v), h| h[v] << k}

#----------Alternate---------

interchanged_hsh = {}

hsh.each do |key, value|
  if interchanged_hsh[value]
    interchanged_hsh[value] << key
  else
    interchanged_hsh[value] = [key]
  end
end

puts interchanged_hsh


# ruby interview/capgem.rb