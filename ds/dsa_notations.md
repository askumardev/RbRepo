# Data Structures Time Complexity Quick Reference

## Introduction

In algorithm analysis, we use asymptotic notations to describe how the runtime or space requirements of an algorithm grow as the input size increases.

---

# Asymptotic Notations

## 1. Big O Notation — O

Big O represents the **worst-case complexity**.

It answers:
> "What is the maximum time an operation can take?"

---

## 2. Omega Notation — Ω

Omega represents the **best-case complexity**.

It answers:
> "What is the minimum time an operation can take?"

---

## 3. Theta Notation — Θ

Theta represents the **average or tight-bound complexity**.

It answers:
> "What is the expected growth rate?"

---

# Common Complexity Values

| Complexity | Name              | Meaning                                                  | Growth Rate           | Example Operations                                 | Real-World Analogy                             | Performance    |
| ---------- | ----------------- | -------------------------------------------------------- | --------------------- | -------------------------------------------------- | ---------------------------------------------- | -------------- |
| O(1)       | Constant Time     | Execution time remains constant regardless of input size | Very Slow Growth      | Array index access, Stack push/pop, HashMap lookup | Picking first book from shelf                  | Excellent      |
| O(log n)   | Logarithmic Time  | Input size reduces by half each step                     | Slow Growth           | Binary Search, Heap operations                     | Searching word in dictionary                   | Very Fast      |
| O(n)       | Linear Time       | Time grows proportionally with input size                | Linear Growth         | Array traversal, Linear Search                     | Reading every name in list                     | Good           |
| O(n log n) | Linearithmic Time | Combination of linear traversal and logarithmic division | Moderate Growth       | Merge Sort, Heap Sort, Quick Sort                  | Sorting books efficiently                      | Efficient      |
| O(n²)      | Quadratic Time    | Nested iterations over input                             | Fast Growth           | Bubble Sort, Comparing every pair                  | Every student shaking hands with every student | Slow           |
| O(n³)      | Cubic Time        | Three nested loops                                       | Very Fast Growth      | Matrix multiplication                              | Comparing every 3-person combination           | Very Slow      |
| O(2ⁿ)      | Exponential Time  | Operations double with each added input                  | Explosive Growth      | Recursive Fibonacci, Subset generation             | Trying every switch combination                | Extremely Slow |
| O(n!)      | Factorial Time    | All possible arrangements are generated                  | Worst Possible Growth | Permutations, Traveling Salesman brute force       | Trying all seating arrangements                | Worst          |


---

# Array Complexity Table

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Access by Index | O(1) | Ω(1) | Θ(1) |
| Search | O(n) | Ω(1) | Θ(n) |
| Insert at End | O(1) | Ω(1) | Θ(1) |
| Insert at Beginning | O(n) | Ω(n) | Θ(n) |
| Delete at End | O(1) | Ω(1) | Θ(1) |

### Explanation
- Arrays provide very fast indexed access.
- Insertions/deletions at the beginning require shifting elements.

---

# Linked List Complexity Table

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Access by Index | O(n) | Ω(1) | Θ(n) |
| Search | O(n) | Ω(1) | Θ(n) |
| Insert at Head | O(1) | Ω(1) | Θ(1) |
| Delete at Head | O(1) | Ω(1) | Θ(1) |

### Explanation
- Linked Lists are efficient for insertions/deletions.
- Random access is slow.

---

# Stack Complexity Table

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Push | O(1) | Ω(1) | Θ(1) |
| Pop | O(1) | Ω(1) | Θ(1) |
| Peek | O(1) | Ω(1) | Θ(1) |

---

# Queue Complexity Table

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Enqueue | O(1) | Ω(1) | Θ(1) |
| Dequeue | O(1) | Ω(1) | Θ(1) |
| Peek | O(1) | Ω(1) | Θ(1) |

---

# HashMap Complexity Table

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Insert | O(n) | Ω(1) | Θ(1) |
| Search | O(n) | Ω(1) | Θ(1) |
| Delete | O(n) | Ω(1) | Θ(1) |

### Explanation
- Average operations are constant time.
- Worst case occurs because of collisions.

---

# Tree Complexity Table

## Binary Search Tree (BST)

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Search | O(n) | Ω(1) | Θ(log n) |
| Insert | O(n) | Ω(1) | Θ(log n) |
| Delete | O(n) | Ω(1) | Θ(log n) |

## AVL Tree

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Search | O(log n) | Ω(1) | Θ(log n) |
| Insert | O(log n) | Ω(log n) | Θ(log n) |
| Delete | O(log n) | Ω(log n) | Θ(log n) |

---

# Heap Complexity Table

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Insert | O(log n) | Ω(1) | Θ(log n) |
| Delete Root | O(log n) | Ω(log n) | Θ(log n) |
| Peek Root | O(1) | Ω(1) | Θ(1) |

---

# Trie Complexity Table

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Insert | O(n) | Ω(1) | Θ(n) |
| Search | O(n) | Ω(1) | Θ(n) |
| Prefix Search | O(n) | Ω(1) | Θ(n) |

---

# Graph Complexity Table

## Adjacency List

| Operation | Big O | Omega | Theta |
|---|---|---|---|
| Add Edge | O(1) | Ω(1) | Θ(1) |
| BFS / DFS | O(V + E) | Ω(V + E) | Θ(V + E) |

---

# Sorting Algorithms Quick Reference

| Algorithm | Best | Average | Worst |
|---|---|---|---|
| Bubble Sort | Ω(n) | Θ(n²) | O(n²) |
| Merge Sort | Ω(n log n) | Θ(n log n) | O(n log n) |
| Quick Sort | Ω(n log n) | Θ(n log n) | O(n²) |

---

# Final Summary Table

| Data Structure | Access | Search | Insert | Delete |
|---|---|---|---|---|
| Array | O(1) | O(n) | O(n) | O(n) |
| Linked List | O(n) | O(n) | O(1) | O(1) |
| Stack | O(n) | O(n) | O(1) | O(1) |
| Queue | O(n) | O(n) | O(1) | O(1) |
| HashMap | N/A | O(1) | O(1) | O(1) |
| BST | O(log n) | O(log n) | O(log n) | O(log n) |

---

# Conclusion

Understanding Big O, Omega, and Theta notations helps in:
- Writing optimized code
- Cracking coding interviews
- Designing scalable systems


# Time and Space Complexity - Complete Notes

Understanding complexity is one of the most important skills in coding interviews.

Whenever you solve a problem, ask:

1. How much time does my algorithm take?
2. How much extra memory does my algorithm use?

---

# 1. Time Complexity

Measures how the running time grows as input size `n` increases.

We ignore:

- CPU speed
- Programming language
- Constants

We only focus on growth.

Example:

```ruby
(1..n).each do |i|
  puts i
end
```

Runs `n` times.

Time Complexity:

```text
O(n)
```

---

# 2. Space Complexity

Measures additional memory used by the algorithm.

Example:

```ruby
result = []

(1..n).each do |i|
  result << i
end
```

Extra array size = n

Space Complexity:

```text
O(n)
```

---

# Big-O Cheat Sheet

| Complexity | Name | Fast? |
|------------|------|--------|
| O(1) | Constant | Excellent |
| O(log n) | Logarithmic | Excellent |
| O(n) | Linear | Good |
| O(n log n) | Linearithmic | Good |
| O(n²) | Quadratic | Slow |
| O(n³) | Cubic | Very Slow |
| O(2ⁿ) | Exponential | Terrible |
| O(n!) | Factorial | Worst |

---

# Step-by-Step Method to Analyze Complexity

Whenever you see code:

### Step 1: Count loops

### Step 2: Count recursive calls

### Step 3: Count nested loops

### Step 4: Count extra memory

### Step 5: Ignore constants

---

# O(1) — Constant Time

Amount of work never changes.

Example:

```ruby
def first_element(arr)
  arr[0]
end
```

No matter if array has:

- 10 elements
- 1000 elements
- 1 million elements

Still one operation.

Time:

```text
O(1)
```

Space:

```text
O(1)
```

---

# O(log n) — Binary Search

Each step cuts problem into half.

Example:

```ruby
while left <= right
  mid = (left + right) / 2

  if arr[mid] == target
    return mid
  elsif arr[mid] < target
    left = mid + 1
  else
    right = mid - 1
  end
end
```

Array size:

```text
1000 → 500 → 250 → 125 → ...
```

Time:

```text
O(log n)
```

Space:

```text
O(1)
```

---

# O(n) — Single Loop

Example:

```ruby
sum = 0

arr.each do |num|
  sum += num
end
```

One pass over array.

Time:

```text
O(n)
```

Space:

```text
O(1)
```

---

# O(n²) — Nested Loops

Example:

```ruby
arr.each do |i|
  arr.each do |j|
    puts i, j
  end
end
```

Operations:

```text
n × n
```

Time:

```text
O(n²)
```

Space:

```text
O(1)
```

---

# O(n³)

Three nested loops.

```ruby
n.times do
  n.times do
    n.times do
      puts "Hello"
    end
  end
end
```

Time:

```text
O(n³)
```

---

# O(n log n)

Common in efficient sorting.

Examples:

- Merge Sort
- Heap Sort
- Quick Sort (average)

Example:

```text
Divide problem → log n
Process each level → n

Total = n log n
```

---

# Exponential O(2ⁿ)

Every call branches into two.

Example:

```ruby
def fib(n)
  return n if n <= 1

  fib(n - 1) + fib(n - 2)
end
```

Tree expands rapidly.

Time:

```text
O(2ⁿ)
```

Very inefficient.

---

# Factorial O(n!)

Example:

Generating permutations.

```ruby
[1,2,3]
```

Produces:

```text
123
132
213
231
312
321
```

Time:

```text
O(n!)
```

---

# How Nested Loops Work

### Example 1

```ruby
n.times do
  puts "Hello"
end
```

Complexity:

```text
O(n)
```

---

### Example 2

```ruby
n.times do
  n.times do
    puts "Hello"
  end
end
```

Complexity:

```text
O(n²)
```

---

### Example 3

```ruby
n.times do
  m.times do
    puts "Hello"
  end
end
```

Complexity:

```text
O(nm)
```

Not O(n²) because variables are different.

---

# Consecutive Loops Add

```ruby
n.times do
end

n.times do
end
```

Complexity:

```text
O(n + n)
```

Simplify:

```text
O(n)
```

---

# Nested Loops Multiply

```ruby
n.times do
  n.times do
  end
end
```

Complexity:

```text
O(n × n)
```

Result:

```text
O(n²)
```

---

# Ignore Constants

```ruby
2n
5n
100n
```

All become:

```text
O(n)
```

Example:

```ruby
2.times do
  arr.each {}
end
```

Actually:

```text
2n
```

Big-O:

```text
O(n)
```

---

# Ignore Smaller Terms

Example:

```text
n² + n + 5
```

Largest term dominates.

Result:

```text
O(n²)
```

---

# Complexity of Common Data Structures

## Array

| Operation | Complexity |
|-----------|------------|
| Access index | O(1) |
| Append end | O(1) |
| Insert beginning | O(n) |
| Delete beginning | O(n) |
| Search | O(n) |

---

## Hash

| Operation | Complexity |
|-----------|------------|
| Insert | O(1) |
| Lookup | O(1) |
| Delete | O(1) |

---

## Set

| Operation | Complexity |
|-----------|------------|
| Add | O(1) |
| Search | O(1) |
| Remove | O(1) |

---

# Complexity of Sorting

| Algorithm | Best | Average | Worst |
|------------|------|---------|------|
| Bubble Sort | O(n) | O(n²) | O(n²) |
| Selection Sort | O(n²) | O(n²) | O(n²) |
| Insertion Sort | O(n) | O(n²) | O(n²) |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) |
| Quick Sort | O(n log n) | O(n log n) | O(n²) |
| Heap Sort | O(n log n) | O(n log n) | O(n log n) |

---

# Space Complexity Rules

## Variables

```ruby
a = 1
b = 2
c = 3
```

Space:

```text
O(1)
```

---

## Array of Size n

```ruby
result = []

arr.each do |num|
  result << num
end
```

Space:

```text
O(n)
```

---

## Hash

```ruby
seen = {}

arr.each do |num|
  seen[num] = true
end
```

Space:

```text
O(n)
```

---

## Matrix

```ruby
matrix = Array.new(n) { Array.new(n) }
```

Space:

```text
O(n²)
```

---

# Recursion Space

Example:

```ruby
def factorial(n)
  return 1 if n == 0

  n * factorial(n - 1)
end
```

Stack:

```text
n
n-1
n-2
...
```

Space:

```text
O(n)
```

Time:

```text
O(n)
```

---

# Fibonacci Recursion

```ruby
def fib(n)
  return n if n <= 1

  fib(n - 1) + fib(n - 2)
end
```

Time:

```text
O(2ⁿ)
```

Space:

```text
O(n)
```

---

# Two Pointer Pattern

```ruby
left = 0
right = arr.length - 1

while left < right
  left += 1
  right -= 1
end
```

Not:

```text
O(n²)
```

Because each pointer moves only once.

Time:

```text
O(n)
```

Space:

```text
O(1)
```

---

# Sliding Window

```ruby
left = 0

arr.each do |right|
  # expand window
end
```

Even though there are two pointers:

Time:

```text
O(n)
```

because each index enters and leaves once.

---

# Hash + Array Problems

Example:

Two Sum

```ruby
seen = {}

arr.each do |num|
  seen[num] = true
end
```

Time:

```text
O(n)
```

Space:

```text
O(n)
```

---

# BFS Complexity

```ruby
queue = [root]
```

Time:

```text
O(V + E)
```

Space:

```text
O(V)
```

---

# DFS Complexity

Time:

```text
O(V + E)
```

Space:

```text
O(H)
```

where H = tree height.

---

# Heap Operations

| Operation | Complexity |
|------------|------------|
| Insert | O(log n) |
| Remove min/max | O(log n) |
| Peek | O(1) |

---

# Interview Shortcut

Whenever interviewer asks:

### Time Complexity?

Ask yourself:

```text
How many times can each element be visited?
```

### Space Complexity?

Ask:

```text
What extra memory am I allocating?
```

---

# Golden Rules

1. Sequential loops → Add.

```text
O(n + m)
```

2. Nested loops → Multiply.

```text
O(nm)
```

3. Ignore constants.

```text
3n → O(n)
```

4. Keep largest term only.

```text
n² + n → O(n²)
```

5. Hash lookup = O(1)

6. Binary Search = O(log n)

7. Merge Sort = O(n log n)

8. Two pointers usually = O(n)

9. Extra array/hash = O(n)

10. Recursion stack contributes to space complexity.

---

# Mental Formula

```text
Loops      → Time
Recursion  → Time + Stack Space
Hash/Array → Space
Nested loop → Multiply
Sequential loops → Add
Largest term wins
```

If you're preparing for interviews, mastering complexity analysis for:

- Arrays
- Strings
- Hash Maps
- Linked Lists
- Trees
- Graphs
- Heaps
- Recursion
- Dynamic Programming

will cover almost every DSA question.