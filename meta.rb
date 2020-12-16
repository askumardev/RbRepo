# frozen_string_literal: true

class String
  def self.add_new_method(name)
    send(:define_method, name) do
      puts "u creates a method #{name}..."
    end
  end
end

String.add_new_method('Satish')
'string'.Satish
