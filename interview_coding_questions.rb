🟢 Easy Level (Basics & Fundamentals)

These test your understanding of Ruby syntax, arrays, hashes, and strings.

1. Reverse a String
# Input: "hello"
# Output: "olleh"
2. Check Palindrome
# Input: "madam"
# Output: true
3. Count Vowels in a String
# Input: "hello world"
# Output: 3
4. Find Maximum Number in Array
# Input: [3, 5, 1, 9, 2]
# Output: 9
5. Remove Duplicates from Array
# Input: [1,2,2,3,4,4]
# Output: [1,2,3,4]
6. FizzBuzz
# Print 1 to 100:
# Multiple of 3 → "Fizz"
# Multiple of 5 → "Buzz"
# Both → "FizzBuzz"
7. Count Frequency of Elements
# Input: ["a","b","a","c","b"]
# Output: {"a"=>2,"b"=>2,"c"=>1}
🟡 Medium Level (Problem Solving + Logic)

These test algorithmic thinking and Ruby idioms.

1. Two Sum
# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
2. Longest Substring Without Repeating Characters
# Input: "abcabcbb"
# Output: 3 ("abc")
3. Group Anagrams
# Input: ["eat","tea","tan","ate","nat","bat"]
# Output: [["eat","tea","ate"],["tan","nat"],["bat"]]
4. Rotate Array
# Input: [1,2,3,4,5,6], k=2
# Output: [5,6,1,2,3,4]
5. Find Missing Number
# Input: [1,2,3,5]
# Output: 4
6. Flatten Nested Array
# Input: [1,[2,[3,4],5]]
# Output: [1,2,3,4,5]
7. Validate Parentheses
# Input: "{[]}"
# Output: true
8. Merge Two Sorted Arrays
# Input: [1,3,5], [2,4,6]
# Output: [1,2,3,4,5,6]
🔴 Hard Level (Advanced + Interview Critical)

These are frequently asked in senior roles (relevant to your experience 👇).

1. Longest Repeated Substring
# Input: "banana"
# Output: "ana"
2. Sliding Window Maximum
# Input: [1,3,-1,-3,5,3,6,7], k=3
# Output: [3,3,5,5,6,7]
3. LRU Cache Implementation
# Design a cache with:
# get(key)
# put(key, value)
# O(1) operations
4. Word Break Problem
# Input: s="leetcode", dict=["leet","code"]
# Output: true
5. Detect Cycle in Linked List
# Return true if cycle exists
6. Top K Frequent Elements
# Input: [1,1,1,2,2,3], k=2
# Output: [1,2]
7. Implement Trie (Prefix Tree)
# insert(word)
# search(word)
# starts_with(prefix)
8. Serialize & Deserialize Binary Tree
# Convert tree to string and back
💡 Bonus (Ruby-Specific Interview Questions)

These are very important for Rails interviews:

1. Explain map vs each
2. Implement your own map
3. What is yield? Write example
4. Difference between Proc and Lambda
5. Monkey patching example
6. Symbol vs String
7. How blocks work internally
🚀 Pro Tip (For You – Senior Role)

Since you're a Senior Rails Engineer, expect:

DS + Algo (Medium/Hard)
Ruby internals (blocks, memory, object model)
System design (APIs, scaling)
ActiveRecord optimization

If you want next:
👉 I can provide solutions with optimized Ruby code
👉 Or create a mock interview (real company style)
👉 Or give Rails-specific coding challenges

Just tell me 👍

DS + Algo (Medium/Hard)

Great—that’s exactly the level expected for senior roles. Here’s a focused set of Medium + Hard DS & Algo problems with strong interview relevance (including patterns you’ll see in companies).

I’ve grouped them by pattern so you learn smarter, not just harder.

🟡 MEDIUM LEVEL (Core Patterns You MUST Know)
🔹 1. Sliding Window
🔸 Longest Substring Without Repeating Characters
# Input: "abcabcbb"
# Output: 3

👉 Tests:

Hash usage
Window expansion/shrinking
🔸 Maximum Sum Subarray of Size K
# Input: [2,1,5,1,3,2], k=3
# Output: 9 (subarray: [5,1,3])
🔹 2. Two Pointers
🔸 Container With Most Water
# Input: [1,8,6,2,5,4,8,3,7]
# Output: 49
🔸 3Sum
# Input: [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]
🔹 3. HashMap / Frequency
🔸 Top K Frequent Elements
# Input: [1,1,1,2,2,3], k=2
# Output: [1,2]
🔸 Subarray Sum Equals K
# Input: [1,1,1], k=2
# Output: 2
🔹 4. Stack
🔸 Daily Temperatures
# Input: [73,74,75,71,69,72,76,73]
# Output: [1,1,4,2,1,1,0,0]
🔸 Largest Rectangle in Histogram
# Input: [2,1,5,6,2,3]
# Output: 10
🔹 5. Binary Search
🔸 Search in Rotated Sorted Array
# Input: [4,5,6,7,0,1,2], target=0
# Output: 4
🔸 Find Peak Element
# Input: [1,2,3,1]
# Output: index 2
🔹 6. Backtracking
🔸 Generate Parentheses
# Input: n=3
# Output: ["((()))","(()())","(())()","()(())","()()()"]
🔸 Subsets
# Input: [1,2,3]
# Output: all subsets
🔴 HARD LEVEL (Senior-Level / FAANG-Level)
🔹 1. Advanced Sliding Window
🔸 Sliding Window Maximum
# Input: [1,3,-1,-3,5,3,6,7], k=3
# Output: [3,3,5,5,6,7]

👉 Requires:

Deque (not brute force)
🔹 2. Dynamic Programming (VERY IMPORTANT)
🔸 Longest Increasing Subsequence (LIS)
# Input: [10,9,2,5,3,7,101,18]
# Output: 4
🔸 Coin Change
# Input: coins=[1,2,5], amount=11
# Output: 3 (5+5+1)
🔸 Edit Distance
# Input: "horse", "ros"
# Output: 3
🔹 3. Graphs
🔸 Number of Islands
# Input: grid of 1s and 0s
# Output: count of islands
🔸 Course Schedule (Cycle Detection)
# Input: prerequisites
# Output: true/false

👉 Uses:

DFS / BFS
Topological sort
🔹 4. Trees
🔸 Lowest Common Ancestor (LCA)
# Find LCA of two nodes in binary tree
🔸 Serialize & Deserialize Binary Tree
# Convert tree ↔ string
🔹 5. Heap / Priority Queue
🔸 Merge K Sorted Lists
# Input: k sorted linked lists
# Output: merged sorted list
🔸 Find Median from Data Stream
# addNum()
# findMedian()

👉 Requires:

Max heap + Min heap
🔹 6. Trie
🔸 Implement Trie
# insert
# search
# starts_with
🔸 Word Search II
# Board + dictionary
# Find all words
🔹 7. Advanced Problems
🔸 Word Break II
# Return all possible sentences
🔸 Minimum Window Substring
# Input: s="ADOBECODEBANC", t="ABC"
# Output: "BANC"
🔸 Alien Dictionary
# Given sorted words, find character order
🧠 MUST-KNOW PATTERNS (Shortcut for Interviews)

Instead of memorizing problems, master these:

Sliding Window
Two Pointers
HashMap + Prefix Sum
Stack (Monotonic)
Binary Search
Backtracking
Dynamic Programming
Graph Traversal (DFS/BFS)
Heap
Trie
🚀 Strategy for YOU (Senior Rails Engineer)

Since you already have strong backend experience:

👉 Focus on:

Writing clean Ruby code (idiomatic)
Optimizing time complexity
Explaining approach clearly
