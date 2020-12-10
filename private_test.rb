class User
  def some_public_method
    # code
  end

  private

  def method_first
    puts "hello method_first"
  end

  def method_second
    puts "hello method_second"
  end

end
class B<User
  b = B.new.send :method_first
  
end
User.new.send :method_second