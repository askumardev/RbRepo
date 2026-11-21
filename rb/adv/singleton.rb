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

#shop1 = Shop.new         # This will actually return the same instance as Shop.instance
shop2 = Shop.instance    # Retrieves the singleton instance

#puts shop1.object_id     # Outputs the object ID of the instance
puts shop2.object_id     # Outputs the object ID of the instance

# require 'singleton'
# class Shop
#   include Singleton
# end

# Shop.new
# Shop.instance.object_id
