# ruby basics/ObjClsOop/include_extend.rb

module SayHello
	def hello
		puts "Hello #{@name}"
	end
end

module SayHi
	def hello
		puts "Hi #{@name}"
	end
end

class Person
	prepend SayHi
	def initialize name
		@name = name
	end
end

p=Person.new "Satish"
p.extend SayHello
p.hello
#p.hi

module SampleModule
  def sample_method
    puts "This is a method from SampleModule"
  end
end

class IncludeClass
  include SampleModule
end

class ExtendClass
  extend SampleModule
end

obj = IncludeClass.new
obj.sample_method  # This will work because the method is included

ExtendClass.sample_method