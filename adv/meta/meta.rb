# ruby adv/meta.rb

def somemethod
  puts "Enter something"
  name = gets.chomp
  send("sample_#{name}")
end

def sample_hello
  puts "some hello message using metaprogramming"
end

def sample_bye
  puts "some bye message using metaprogramming"
end

somemethod

puts("-------Alternate below----------")

class String
  def self.add_new_method(name)
    send(:define_method, name) do
      puts "You have created a method #{name}..."
    end
  end
end

String.add_new_method('Satish')
'string'.Satish


