# frozen_string_literal: true

module C
  def name
    puts 'C'
  end

  def name1
    puts 'name C'
  end
end

module D
  def name
    puts 'D'
  end
end

module E
  def name
    puts 'E'
  end
end

class A
  def name
    puts 'A'
  end
end

class B < A
  # prepend E
  include C
  include D

  def name
    puts 'B'
  end
end

B.new.name1
puts B.ancestors
# obj = B.new.name
# puts obj.methods
# puts obj.methods.count
