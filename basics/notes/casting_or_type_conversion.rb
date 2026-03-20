#------------float---------
# irb(main):002> "123.550".to_f
# => 123.55
# irb(main):002> "123.550".to_f
# => 123.55
# irb(main):003> "123.555".to_f
# => 123.555

# irb(main):006> Float("123.50")
# => 123.5
# "something".to_f
# => 0.0
# irb(main):010> Float("something")
# <internal:kernel>:214:in `Float': invalid value for Float(): "something" (ArgumentError)>


#-----------String-----------
# irb(main):007> 123.45.to_s
# => "123.45"
# irb(main):008> String(123.45)
# => "123.45"


#---------integer-------
# irb(main):011> "123.45".to_i
# => 123
# irb(main):012> "123-foo".to_i
# => 123
# irb(main):013> "foo123".to_i
# => 0
# irb(main):014> "something".to_i
# => 0

# irb(main):015> Integer("something")
# <internal:kernel>:307:in `Integer': invalid value for Integer(): "something" (ArgumentError)


#=============================================
# 🔍 Key Difference
# ✅ "something".to_i

# Forgiving / lenient

# Converts what it can, otherwise returns 0

# Examples:
# "123".to_i        # => 123
# "123abc".to_i     # => 123
# "abc123".to_i     # => 0
# "something".to_i  # => 0
# 👉 It never raises an error — just gives 0

# ❌ Integer("something")
#----------------------------------
# Strict conversion

# Raises error if string is not a valid integer

# Integer("123")       # => 123
# Integer("123abc")    # ❌ ArgumentError
# Integer("something") # ❌ ArgumentError

# Error:

# ArgumentError: invalid value for Integer()

#-------------------------------
# 🧠 Why this matters (important in real apps)
# ⚠️ Problem with to_i
# params[:age].to_i

# If user sends:

# { "age": "abc" }

# 👉 You silently get:

# 0

# 💥 This can introduce bugs in production

# ✅ Safer approach
# Integer(params[:age])

# 👉 Raises error → you can handle it properly
#----------------------------------
# 💡 Best practice (Rails-friendly)
# def safe_integer(value)
#   Integer(value)
# rescue ArgumentError, TypeError
#   nil
# end
#=================================
# 🔥 Pro tip (very useful in APIs)

# Use strict parsing when:
# handling user input
# processing financial data
# validating IDs / counts
#-------------------------------
# Use to_i when:

# quick fallback is acceptable

# parsing loosely formatted strings
