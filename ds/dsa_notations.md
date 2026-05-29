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

| Complexity | Meaning |
|---|---|
| O(1) | Constant Time |
| O(log n) | Logarithmic Time |
| O(n) | Linear Time |
| O(n log n) | Linearithmic Time |
| O(n²) | Quadratic Time |
| O(2ⁿ) | Exponential Time |

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
