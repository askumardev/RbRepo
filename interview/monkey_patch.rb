# frozen_string_literal: true

# Feature to add new method to existing class in runtime

class Object
  def sample_method
    puts "============> #{self}"
  end
end

'satish'.sample_method
