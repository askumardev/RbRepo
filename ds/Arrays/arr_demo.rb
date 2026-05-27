def insertion(arr)
  puts "\nInsertion Options:"
  puts "1. Insert at last"
  puts "2. Insert at specific position"

  print "Enter choice: "
  choice = gets.chomp

  print "Enter value to insert: "
  value = gets.chomp.to_i

  case choice
  when '1'
    arr << value
    puts "#{value} inserted at last."

  when '2'
    print "Enter position (0 to #{arr.length}): "
    position = gets.chomp.to_i

    if position >= 0 && position <= arr.length
      arr.insert(position, value)
      puts "#{value} inserted at position #{position}."
    else
      puts "Invalid position!"
    end

  else
    puts "Invalid insertion choice!"
  end

  puts "Updated Array: #{arr.inspect}"
end

def deletion(arr)
  puts "\nDeletion Options:"
  puts "1. Delete by value"
  puts "2. Delete by position"

  print "Enter choice: "
  choice = gets.chomp

  case choice
  when '1'
    print "Enter value to delete: "
    value = gets.chomp.to_i

    if arr.delete(value)
      puts "#{value} deleted successfully."
    else
      puts "#{value} not found!"
    end

  when '2'
    print "Enter position (0 to #{arr.length - 1}): "
    position = gets.chomp.to_i

    if position >= 0 && position < arr.length
      deleted = arr.delete_at(position)
      puts "#{deleted} deleted from position #{position}."
    else
      puts "Invalid position!"
    end

  else
    puts "Invalid deletion choice!"
  end

  puts "Updated Array: #{arr.inspect}"
end

def updation(arr)
  puts "\nUpdation Options:"
  puts "1. Update by value"
  puts "2. Update by position"

  print "Enter choice: "
  choice = gets.chomp

  case choice
  when '1'
    print "Enter old value: "
    old_value = gets.chomp.to_i

    if arr.include?(old_value)
      print "Enter new value: "
      new_value = gets.chomp.to_i

      index = arr.index(old_value)
      arr[index] = new_value

      puts "#{old_value} updated to #{new_value}."
    else
      puts "#{old_value} not found!"
    end

  when '2'
    print "Enter position (0 to #{arr.length - 1}): "
    position = gets.chomp.to_i

    if position >= 0 && position < arr.length
      print "Enter new value: "
      new_value = gets.chomp.to_i

      old_value = arr[position]
      arr[position] = new_value

      puts "#{old_value} updated to #{new_value} at position #{position}."
    else
      puts "Invalid position!"
    end

  else
    puts "Invalid updation choice!"
  end

  puts "Updated Array: #{arr.inspect}"
end

def main
  arr = [10, 20, 30, 40]

  puts "Initial Array: #{arr.inspect}"

  loop do
    puts "\nMain Menu:"
    puts "1. Insertion"
    puts "2. Deletion"
    puts "3. Updation"

    print "Enter choice (1/2/3): "
    mode = gets.chomp

    case mode
    when '1'
      insertion(arr)

    when '2'
      deletion(arr)

    when '3'
      updation(arr)

    else
      puts "Invalid choice!"
    end

    print "\nDo you want to continue? (y/n): "
    choice = gets.chomp.downcase

    break if choice != 'y'
  end

  puts "\nFinal Array: #{arr.inspect}"
  puts "Thanks!"
end

# Start Program
main

# ruby ds/Arrays/arr_demo.rb
