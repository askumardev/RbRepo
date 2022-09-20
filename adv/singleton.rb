# ruby adv/singleton.rb

# Class A
#   def self.hi
#     puts "hi"
#   end
# end

# A.hi

require 'singleton'
class Shop
  include Singleton
end

Shop.new
Shop.instance.object_id
