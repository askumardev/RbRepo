# The safe navigation operator in Ruby is:

# &.

# It’s sometimes called the “lonely operator”.

# 🔍 What it does

# It lets you call a method only if the object is not nil.

# 👉 If the object is nil, it returns nil instead of raising an error.

# ❌ Without safe navigation
# user = nil
# user.name

# 💥 Error:

# NoMethodError: undefined method `name' for nil:NilClass
# ✅ With safe navigation
# user = nil
# user&.name
# # => nil
# 🧠 Real-world example (very common in Rails)
# user&.profile&.address&.city

# 👉 This safely chains calls:

# If user is nil → returns nil

# If profile is nil → returns nil

# No crashes 🚀

# ⚖️ Equivalent old way

# Before Ruby 2.3, you’d write:

# user && user.profile && user.profile.address && user.profile.address.city

# 😬 Hard to read, right?

# ✅ With arguments
# user&.update(name: "Satish")
# ⚠️ Important behavior
# 1. Only skips on nil
# false&.to_s
# # => "false"

# 👉 It does NOT skip for false, only nil

# 2. Assignment works too
# user&.name = "Satish"
# 3. Be careful — it can hide bugs
# order&.total_price

# 👉 If order is unexpectedly nil, you may silently ignore a real issue

# 💡 Best practices (for you as a Rails dev)

# Use &. when:

# Optional associations (user.profile)

# View helpers

# JSON building

# Avoid overusing when:

# Object must exist

# You want failures to surface

# 🚀 Example in Rails API
# render json: {
#   name: user&.name,
#   city: user&.profile&.city
# }
