# ruby interview/singleton.rb

require 'singleton'

class Logger
  include Singleton
end

#Logger.new #private method `new' called for Logger:Class (NoMethodError)
first = Logger.instance
second = Logger.instance
p first == second


# class CustomSingleton
#   attr_reader :name
#   private_class_method :new

#   def initialize(name)
#     @name = name
#   end

#   def self.instance(name)
#     @instance ||= new(name)
#   end
# end

# p CustomSingleton.instance("satish").name
# p CustomSingleton.instance("kumar").name