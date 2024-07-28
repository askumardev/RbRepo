# ruby basics/block_demo.rb

p "------single line block------"
[1,2,3].each {|num| p num}

p "------multi line block------"
[4,5,6].each do |num|
  p num
end

def block_demo
  p "===block starting==="
  yield if block_given?
  p "===block executed==="
end

block_demo do
  p "===block data==="
end
