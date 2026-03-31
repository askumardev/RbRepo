class Hello
  def greet
<<<<<<< HEAD
    "Hello.....!"
=======
    "Hello"
>>>>>>> c1d2aa1 (meta updates)
  end

  alias_method :original_greet, :greet

  def greet
    original_greet + " Satish"
  end
end

puts Hello.new.greet  # => Hello Satish

# ruby adv/meta/alias.rb
