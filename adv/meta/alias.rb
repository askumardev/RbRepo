class Hello
  def greet
    "Hello.....!"
    "Hello"
  end

  alias_method :original_greet, :greet

  def greet
    original_greet + " Satish"
  end
end

puts Hello.new.greet  # => Hello Satish

# ruby adv/meta/alias.rb
