# ruby basics/ancestors_superclass.rb

module SampMod
  def sample
    puts "sample module data"
  end
end

class SampCls
  def sample
    puts "sample class data"
  end
end

s = SampCls.new
s.sample
p "--------------------"
puts SampCls.ancestors
p "--------------------"
puts s.class.ancestors

p "---------class superclass--------------"
p SampCls.class
p SampCls.class.superclass
p SampCls.class.superclass.superclass
p SampCls.class.superclass.superclass.superclass

p "---------class superclass--------------"
p SampMod.class
p SampMod.class.superclass
p SampMod.class.superclass.superclass
p SampMod.class.superclass.superclass.superclass #nil