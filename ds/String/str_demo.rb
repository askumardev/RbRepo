
class StringOperations
  def initialize
    @str = ""
  end

  def set_string(value)
    @str = value
  end

  def reverse_string
    puts "Reversed String: #{@str.reverse}"
  end

  def palindrome?
    if @str == @str.reverse
      puts "Palindrome"
    else
      puts "Not a Palindrome"
    end
  end

  def count_characters
    freq = Hash.new(0)

    @str.each_char do |char|
      freq[char] += 1
    end

    puts freq
  end

  def display
    puts "Current String: #{@str}"
  end
end

obj = StringOperations.new

loop do
  puts "\n1. Set String"
  puts "2. Reverse String"
  puts "3. Palindrome Check"
  puts "4. Character Count"
  puts "5. Display"
  puts "6. Exit"

  print "Enter choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter String: "
    str = gets.chomp
    obj.set_string(str)

  when 2
    obj.reverse_string

  when 3
    obj.palindrome?
  when 4
    obj.count_characters

  when 5
    obj.display

  when 6
    break

  else
    puts "Invalid Choice"
  end
end


# ruby ds/String/str_demo.rb
