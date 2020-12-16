# frozen_string_literal: true

class Customer
  def self.display_info(*args)
    case args.size
    when 1
      puts "Their name is #{args[0]}"
    when 2
      puts "Their name is #{args[0]} #{args[1]}"
    when 3
      case args[2].class.name
      when String
        puts "Their name is #{args[0]} #{args[1]} and their email address is #{args[2]}"
      when Integer, Integer
        puts "Their name is #{args[0]} #{args[1]} and they are #{args[2]} years old"
      end
    end
  end
end

Customer.display_info('John')
# Their name is John
Customer.display_info('John', 'Smith')
# Their name is John Smith
Customer.display_info('John', 'Smith', 'j.smith@medium.com')
# Their name is John Smith and their email address is j.smith@medium.com
Customer.display_info('John', 'Smith', 34)
# Their name is John Smith and they are 34 years old
