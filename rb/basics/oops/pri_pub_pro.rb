class Demo
    def s1
        puts "This is a public method"
        s2
        s3  
    end
    protected
    def s2
        puts "This is a protected method"
    end
    private
    def s3
        puts "This is a private method"
    end
end
d = Demo.new
d.s1
# d.s2 # This will raise an error because s2 is protected
# d.s3 # This will raise an error because s3 is private
