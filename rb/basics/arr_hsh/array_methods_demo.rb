# ruby arr_hsh/array_methods_demo.rb

a = [1,2,2,3,4,5]
p "-----uniq------"
p a.uniq
p a
p "-----append new element------"
a << 6
p a
p "-----print last element------"
p a.last
p a.last(2)
p "-----print arr with out duplicates !------"
p a.uniq!
p a
p "-----arr length------"
len = a.length
 p len
p "-----print first 3 element------"
p a.take(3)
p "-----remove first 3 element------"
p a
p a.drop(3)
p "-----print sqares of each element------"
sq = a.map{ |x| x*x }
p sq
p "-----print positive numbers------"
pos = a.select{ |x| x % 2 == 0}
p pos


p "-----shift------"
sft=[]
sft = a.shift
p sft
p a
p sft << sft.unshift(a.pop)




