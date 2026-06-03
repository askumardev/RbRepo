module A

    def add

        "addition of single digits"

    end

end

module B

    def add

        "addition of double digits"

    end

end

class addition

    include A
    prepend B

    def add

        Additionn on multiple digits"

    end

end

obj = Addition.new

obj.add
