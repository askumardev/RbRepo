# ruby adv/oops/req_relative.rb

require_relative '../../lib/addition.rb'
#require 'memory'

class A
  def add(str)
    p "add...."
  end
end

obj = A.new
obj.add("1,2")