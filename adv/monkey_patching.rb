# ruby adv/monkey_patching.rb

# Monkey patching in Ruby refers to the practice of dynamically modifying or extending classes or modules at runtime. 
# While it can be a powerful tool, 
# it should be used with caution as it can lead to unexpected behavior and maintenance challenges. 

class Object
  def print_to_s
    puts("---#{to_s}")
  end
end

"cat".print_to_s
Time.now.print_to_s

class Time
  def print_to_s
    puts("=====#{to_s}")
  end
end

Time.now.print_to_s