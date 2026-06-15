class Test
end

Test.instance_eval do
  def hello
    "class method"
  end
end

Test.class_eval do
  def hello
    "instance method"
  end
end

puts Test.hello
puts Test.new.hello

# ruby adv/meta/ins_cls_eval.rb
