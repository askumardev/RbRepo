class User
  def method_missing(method_name, *args)
    if method_name == :name
      "Satish"
    else
      super
    end
  end
end

user = User.new

puts user.name
puts user.respond_to?(:name)


# Output:
# Satish
# false


# This is the problem.

# The object can respond to name through method_missing, but respond_to? 
# reports false.

# Why?

# Because respond_to? normally checks whether the method exists through 
# the regular method lookup mechanism. It does not automatically know which 
# methods your method_missing handles.
# 3. Solution: respond_to_missing?
# Override respond_to_missing? to tell Ruby which dynamically handled 
# methods are supported.

class User1
  def method_missing(method_name, *args)
    if method_name == :name
      "Satish"
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name == :name || super
  end
end

user1 = User1.new

puts user1.name
puts user.respond_to?(:name)