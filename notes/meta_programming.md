<!-- # Metaprogramming in Ruby refers to the ability to write code that can generate other code or modify the behavior of a program at runtime.
# Ruby's flexibility allows for powerful metaprogramming techniques, and it is a key feature of the language.

# Some examples of metaprogramming techniques in Ruby include:

# Dynamically defining classes and methods: Ruby allows you to define new classes and methods at runtime using the Class.new and define_method methods.
#This is useful when you need to generate classes or methods on the fly, such as when building a domain-specific language.

# Using method_missing: When a method is called that does not exist, Ruby will call the method_missing method, which you can override to implement custom behavior.
# This is useful for implementing dynamic dispatch, where the behavior of a method can vary depending on the arguments passed to it.

# Defining class macros: Ruby allows you to define macros that can generate code, such as attr_accessor, which generates getters and setters for instance variables.
 #This is useful when you want to provide a concise way to define common functionality.

# Using reflection: Ruby provides reflection APIs that allow you to introspect the code at runtime, such as the Object#methods method, which returns a list of all the methods defined on an object.
# This is useful when you need to build tools that analyze or manipulate code.

# Metaprogramming in Ruby can be very powerful, but it can also make code harder to read and understand, particularly if it is overused or used inappropriately.
# It is important to use metaprogramming judiciously and to document it clearly so that other developers can understand the code.

# Metaprogramming in Ruby -->

Metaprogramming in Ruby refers to the ability to write code that can generate other code or modify program behavior at runtime.

Ruby treats classes and methods as objects, making it one of the most powerful languages for metaprogramming. Frameworks like Rails heavily rely on these features (`has_many`, `validates`, `before_action`, etc.).

---

# 1. Dynamically Defining Methods

Ruby allows methods to be created during runtime using `define_method`.

### Example

```ruby
class User
  [:name, :email, :city].each do |attribute|
    define_method(attribute) do
      instance_variable_get("@#{attribute}")
    end

    define_method("#{attribute}=") do |value|
      instance_variable_set("@#{attribute}", value)
    end
  end
end

user = User.new
user.name = "Satish"
user.email = "abc@test.com"

puts user.name
puts user.email
```

### Similar to

```ruby
attr_accessor :name, :email, :city
```

---

# 2. Dynamically Creating Classes

Classes themselves can be created at runtime.

```ruby
Employee = Class.new do
  def greet
    "Hello Employee"
  end
end

emp = Employee.new
puts emp.greet
```

Useful when building:

- DSLs
- API wrappers
- Dynamic models

---

# 3. Using `method_missing`

When Ruby cannot find a method, it invokes `method_missing`.

### Example

```ruby
class User
  def method_missing(method_name, *args)
    if method_name.to_s.start_with?("find_by_")
      attribute = method_name.to_s.gsub("find_by_", "")
      puts "Searching user by #{attribute}: #{args.first}"
    else
      super
    end
  end
end

user = User.new
user.find_by_email("abc@test.com")
```

Output:

```text
Searching user by email: abc@test.com
```

### Rails internally uses similar concepts.

---

# 4. Implementing `respond_to_missing?`

Whenever `method_missing` is used, `respond_to_missing?` should also be implemented.

```ruby
class User
  def method_missing(method_name, *args)
    if method_name.to_s.start_with?("find_by_")
      puts "Dynamic finder"
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?("find_by_") || super
  end
end

user = User.new

puts user.respond_to?(:find_by_email)
# true
```

---

# 5. Class Macros

Macros generate code when the class is being defined.

Example:

```ruby
class User
  attr_accessor :name
end
```

Equivalent to:

```ruby
class User
  def name
    @name
  end

  def name=(value)
    @name = value
  end
end
```

### Custom Macro Example

```ruby
class ApplicationRecord
  def self.audit(attribute)
    define_method("print_#{attribute}") do
      puts send(attribute)
    end
  end
end

class User < ApplicationRecord
  attr_accessor :email

  audit :email
end

user = User.new
user.email = "abc@test.com"
user.print_email
```

Rails examples:

```ruby
has_many
belongs_to
validates
before_action
scope
```

---

# 6. Reflection (Introspection)

Ruby can inspect objects at runtime.

```ruby
user.methods
user.class
user.instance_variables
user.instance_of?(User)
```

Example:

```ruby
class User
  attr_accessor :name
end

user = User.new

p user.methods.take(10)
p user.instance_variables
```

Useful for:

- Debugging
- Building serializers
- Generic frameworks

---

# 7. Accessing Instance Variables Dynamically

```ruby
class User
  def initialize
    @name = "Satish"
  end
end

user = User.new

puts user.instance_variable_get("@name")

user.instance_variable_set("@name", "Kumar")

puts user.instance_variable_get("@name")
```

---

# 8. Dynamically Calling Methods (`send`)

```ruby
class User
  def greet
    "Hello"
  end
end

user = User.new

puts user.send(:greet)
```

Passing arguments:

```ruby
class Calculator
  def add(a, b)
    a + b
  end
end

calculator = Calculator.new

puts calculator.send(:add, 10, 20)
```

Rails uses this heavily.

---

# 9. Opening Existing Classes (Monkey Patching)

Ruby allows modifying built-in classes.

```ruby
class String
  def shout
    upcase + "!"
  end
end

puts "hello".shout
```

Output:

```text
HELLO!
```

### Danger

Monkey patching can cause:

- Unexpected behavior
- Conflicts with gems
- Maintenance problems

Prefer refinements when possible.

---

# 10. Refinements (Safer Alternative to Monkey Patching)

```ruby
module StringExtension
  refine String do
    def shout
      upcase + "!"
    end
  end
end

using StringExtension

puts "hello".shout
```

Scope is limited and safer.

---

# 11. Singleton Methods

Methods can be added to a specific object.

```ruby
user = Object.new

def user.greet
  "Hello"
end

puts user.greet
```

Another object won't have that method.

```ruby
another_user = Object.new

another_user.greet
# NoMethodError
```

---

# 12. `class_eval`

Adds methods to an existing class dynamically.

```ruby
class User
end

User.class_eval do
  def greet
    "Hello User"
  end
end

puts User.new.greet
```

Rails uses this extensively.

---

# 13. `instance_eval`

Changes the context to a single object.

```ruby
user = User.new

user.instance_eval do
  @name = "Satish"
end
```

Can access private instance variables.

---

# 14. Hooks and Callbacks

Ruby provides lifecycle hooks.

### inherited

```ruby
class Parent
  def self.inherited(child)
    puts "#{child} inherited from Parent"
  end
end

class User < Parent
end
```

Output:

```text
User inherited from Parent
```

### included

```ruby
module LoggerModule
  def self.included(base)
    puts "#{base} included LoggerModule"
  end
end

class User
  include LoggerModule
end
```

---

# 15. `const_get` and `const_set`

Access constants dynamically.

```ruby
class User
end

klass = Object.const_get("User")

puts klass.new.class
```

Creating constants:

```ruby
Object.const_set("Employee", Class.new)

puts Employee.new.class
```

---

# 16. Building DSLs (Domain Specific Languages)

One of Ruby's greatest strengths.

Example:

```ruby
class Router
  def get(path)
    puts "GET #{path}"
  end
end

router = Router.new

router.instance_eval do
  get "/users"
  get "/products"
end
```

Rails DSL examples:

```ruby
routes.draw do
  resources :users
end

validates :email, presence: true

has_many :orders
```

---

# 17. Modules and Dynamic Inclusion

```ruby
module Greeting
  def greet
    "Hello"
  end
end

class User
end

User.include(Greeting)

puts User.new.greet
```

Dynamic inclusion:

```ruby
User.send(:include, Greeting)
```

---

# 18. Aliasing Methods

```ruby
class User
  def greet
    "Hello"
  end

  alias original_greet greet

  def greet
    "#{original_greet} Satish"
  end
end

puts User.new.greet
```

---

# 19. TracePoint API

Useful for debugging and profiling.

```ruby
trace = TracePoint.new(:call) do |tp|
  puts "Method called: #{tp.method_id}"
end

trace.enable

"hello".upcase

trace.disable
```

---

# 20. Eigenclass (Singleton Class)

Every object has its own hidden class.

```ruby
user = Object.new

class << user
  def greet
    "Hello"
  end
end

puts user.greet
```

This is how class methods are implemented.

```ruby
class User
  class << self
    def active
      puts "Active users"
    end
  end
end

User.active
```

---

# Real Rails Examples of Metaprogramming

### Associations

```ruby
class User < ApplicationRecord
  has_many :orders
end
```

Rails generates:

```ruby
user.orders
user.orders.build
user.orders.create
```

---

### Validations

```ruby
validates :email, presence: true
```

Generates validation methods internally.

---

### Scopes

```ruby
scope :active, -> { where(active: true) }
```

Allows:

```ruby
User.active
```

---

### Callbacks

```ruby
before_save :normalize_email
```

Generates callback chains dynamically.

---

# Advantages

- Eliminates repetitive code.
- Helps build DSLs.
- Makes frameworks powerful.
- Improves flexibility.
- Enables generic libraries.

---

# Disadvantages

- Harder to debug.
- Can reduce readability.
- Stack traces become confusing.
- Excessive use makes maintenance difficult.
- Monkey patching can introduce hidden bugs.

---

# Interview Answer (Short Version)

**Metaprogramming is the capability of Ruby to write code that generates or modifies other code during runtime.**

Ruby provides features such as:

1. `define_method`
2. `method_missing`
3. Reflection (`methods`, `instance_variables`)
4. Class macros (`attr_accessor`)
5. `send`
6. `class_eval` and `instance_eval`
7. Dynamic class creation (`Class.new`)
8. Monkey patching and refinements
9. Hooks (`included`, `inherited`)
10. DSL creation

Rails heavily uses metaprogramming in:

- `has_many`
- `belongs_to`
- `validates`
- `scope`
- `before_action`

The major benefit is reduced boilerplate code, while the trade-off is reduced readability if overused.
