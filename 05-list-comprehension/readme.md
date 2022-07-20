# Chapter 5: List Comprehension

1. Using a list comprehension, give an expression that calculates the sum of the ﬁrst k integer squares.

```haskell
squared_sum :: Int -> Int
squared_sum k = sum [n^2 | n <- [1..k]]
```

2. Suppose that a coordinate grid of size _m x n_ is given by the list of all pairs _(x, y)_ of integers such that _0 <= x <= m_ and _0 <= y <= n_. Using a list comprehension, deﬁne a function `grid :: Int -> Int -> [(Int,Int)]` that returns a coordinate grid of a given size.
