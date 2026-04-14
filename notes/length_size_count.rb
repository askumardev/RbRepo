In Ruby, length, size, and count often look similar—but they’re not always the same. Here’s a clear breakdown 👇

🔹 1. length
Returns the number of elements in a collection
Works on: Array, String, Hash, etc.
No arguments (usually)
arr = [1, 2, 3, 4]

arr.length
# => 4

👉 Think: “How many items total?”

🔹 2. size
Almost identical to length
Alias for length in most cases
Preferred in some libraries (like ActiveRecord)
arr.size
# => 4

👉 In Rails:

size can be optimized (e.g., avoids DB query if already loaded)
🔹 3. count
More powerful and flexible
Can:
Return total count
Count specific values
Count using a condition (block)
✅ Basic usage
arr.count
# => 4
✅ Count specific value
arr = [1, 2, 2, 3]

arr.count(2)
# => 2
✅ Count with condition
arr.count { |x| x.even? }
# => 2

👉 Think: “Count with logic/filter”

🔥 Key Differences
| Method   | Behavior in Plain Ruby       | Complexity | Best Use Case                |
| :------- | :--------------------------- | :--------- | :--------------------------- |
| `length` | Returns number of elements   | O(1)       | General purpose / Strings    |
| `size`   | Returns number of elements   | O(1)       | General purpose / Collections|
| `count`  | Can take arguments or blocks | O(n)       | When filtering or searching  |
⚠️ Important (Rails / ActiveRecord)
users = User.where(active: true)

users.length  # Loads all records into memory
users.size    # Smart (may use COUNT query)
users.count   # Always runs SQL COUNT

👉 Best practice in Rails:

Use size when unsure
Use count for DB-level counting
💡 Quick Rule
Use length / size → when you just need total elements
Use count → when filtering or counting specific conditions
