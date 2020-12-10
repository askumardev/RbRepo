#Feature to add new method to existing class in runtime

class Object
    def sample_method
        puts "============> #{to_s}"
    end
end

"satish".sample_method