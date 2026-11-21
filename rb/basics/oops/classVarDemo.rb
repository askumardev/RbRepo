puts "--------instance Variable------------"
class Parent
  @count = 0

  def self.count
    @count
  end
end

class Child < Parent
  @count = 10
end

puts Parent.count  # 0 ✅

puts "--------Class Variable------------"

class Parent
  @@count = 0

  def self.count
    @@count
  end
end

class Child < Parent
  @@count = 10
end

puts Parent.count  # 10 ❗ (unexpected)


# ruby basics/classVarDemo.rb
