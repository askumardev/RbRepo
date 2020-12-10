class Abc
    def initialize(a:a,b:b)
        @a=a
        @b=b
    end
    def test
        puts @a
        puts @b
    end

end

class Cde < Abc
    def samp
        puts "Hello samp"
    end
end

cde = Cde.new(a:"hello",b:"world")
cde.samp
cde.test
