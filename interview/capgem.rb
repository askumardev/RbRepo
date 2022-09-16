hsh = {'Input.txt' => 'Randy', 'Code.py' => 'Stan', 'Output.txt' => 'Randy'}
h = Hash.new{ |hash, key| hash[key] = [] }
p hsh.each_with_object(h) {|(k,v), h| h[v] << k}

# ruby interview/capgem.rb