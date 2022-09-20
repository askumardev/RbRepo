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