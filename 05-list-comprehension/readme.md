# Chapter 5: List Comprehension

1. Using a list comprehension, give an expression that calculates the sum of the ﬁrst k integer squares.

```haskell
squared_sum :: Int -> Int
squared_sum k = sum [n^2 | n <- [1..k]]
```

2. Suppose that a coordinate grid of size `m x n` is given by the list of all pairs `(x, y)` of integers such that `0 <= x <= m` and `0 <= y <= n`. Using a list comprehension, deﬁne a function `grid :: Int -> Int -> [(Int,Int)]` that returns a coordinate grid of a given size.

```haskell
grid :: Int -> Int -> [(Int,Int)]
grid m n = [(x, y) | x <- [0..m], y <- [0..n]]
```

3. Using a list comprehension and the function grid above, deﬁne a function `square :: Int -> [(Int Int)]` that returns a coordinate square of size `n`, excluding the diagonal from `(0, 0)` to `(n, n)`.

```haskell
square :: Int -> [(Int, Int)]
square n = [(x, y) | x <- [0..n], y <- [0..n], x /= y]
```

4. In a similar way to the function length, show how the library function `myReplicate :: Int -> a -> [a]` that produces a list of identical elements can be deﬁned using a list comprehension.

```haskell
myReplicate :: Int -> a -> [a]
myReplicate n k = [k | _ <- [0..n - 1]]
```

5. A triple `(x, y, z)` of positive integers is Pythagorean if it satisﬁes the equation `x^2 + y^2 = z^2`. Using a list comprehension with three generators, deﬁne a function `pyths :: Int -> [(Int,Int,Int)]` that returns the list of all such triples whose components are at most a given limit.

```haskell
pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]
```
