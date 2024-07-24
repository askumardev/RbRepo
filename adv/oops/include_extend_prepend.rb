# ruby basics/ObjClsOop/include_extend_prepend.rb

module Greet
  def say
    puts "Hello..."
  end
end

class IncludeClass
  include Greet
end

class ExtendClass
  extend Greet
end

class PrependClass
  prepend Greet
end

p IncludeClass.ancestors
p "-----------------------------"
p ExtendClass.ancestors
p "-----------------------------"
p PrependClass.ancestors
