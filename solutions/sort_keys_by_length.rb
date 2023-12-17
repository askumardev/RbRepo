# Sort keys in hash based on length

# For instance, the hash:
# { abc: 'hello', 'another_key' => 123, 4567 => 'third' }
# should result in:
# ["abc", "4567", "another_key"]

hsh = { abc: 'hello', 'another_key' => 123, 4567 => 'third' }
hsh =  hsh.keys.map{|x| x.to_s}.sort_by { |word| word.length }
p hsh


# Answer
# As is always true in programming, there are in fact multiple ways to accomplish this. The most straightforward answer would be of the form:
# hsh.keys.map(&:to_s).sort_by(&:length)
# or:
# hsh.keys.collect(&:to_s).sort_by { |key| key.length }
# Alternatively, Ruby’s Enumerable mixin provides many methods to operate on collections. The key here is to turn the hash keys into a collection, convert them all to strings, then sort the array.
# def key_sort hsh
#    hsh.keys.collect(&:to_s).sort { |a, b| a.length <=> b.length }
# end
# An equivalent call of the collect method is done with the usual block syntax of:
# collect { |x| x.to_s }