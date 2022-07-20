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

4. In a similar way to the function length, show how the library function `my_replicate :: Int -> a -> [a]` that produces a list of identical elements can be deﬁned using a list comprehension.

```haskell
my_replicate :: Int -> a -> [a]
my_replicate n k = [k | _ <- [0..n - 1]]
```

5. A triple `(x, y, z)` of positive integers is Pythagorean if it satisﬁes the equation `x^2 + y^2 = z^2`. Using a list comprehension with three generators, deﬁne a function `pyths :: Int -> [(Int,Int,Int)]` that returns the list of all such triples whose components are at most a given limit.

```haskell
pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]
```

6. A positive integer is perfect if it equals the sum of all of its factors, excluding the number itself. Using a list comprehension and the function factors, deﬁne a function `perfects :: Int -> [Int]` that returns the list of all perfect numbers up to a given limit.

```haskell
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfect :: Int -> Bool
perfect n = sum (init (factors n)) == n

perfects :: Int -> [Int]
perfects n = [k | k <- [1..n], perfect k]
```

7. Show how the list comprehension `[(x, y) | x <- [1, 2], y <- [3, 4]]` with two generators can be re-expressed using two comprehensions with single generators.

```haskell
Prelude> concat [[(x, y) | y <- [3, 4]] | x <- [1, 2]]
```

8. Redeﬁne the function positions using the function `find`.

```haskell
-- using zip
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x’,i) <- zip xs [0..], x == x’]

-- using find
positions :: Eq a => a -> [a] -> [Int]
-- TODO
```

9. Show how a list comprehension can be used to deﬁne a function `scalar_product :: [Int] -> [Int] -> Int` that returns the scalar product of two lists.

```haskell
scalar_product :: [Int] -> [Int] -> Int
scalar_product xs ys = sum [r * s | (r, s) <- zip xs ys]
```

10. Modify the Caesar cipher program to also handle upper-case letters.

```haskell
-- TODO
```
