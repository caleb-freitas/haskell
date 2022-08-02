# Chapter 6: Recursion

1. How does the recursive version of the factorial function behave if applied to a negative argument, such as (-1)? Modify the deﬁnition to prohibit negative arguments by adding a guard to the recursive case.

```haskell
factorial :: Int -> Int
factorial n | n < 0 = error "invalid argument"
            | n == 0 = 1
            | otherwise = n * factorial(n - 1)

```

2. Deﬁne a recursive function `sumdown :: Int -> Int` that returns the sum of the non-negative integers from a given value down to zero. For example, sumdown 3 should return the result `3 + 2 + 1 + 0 = 6`.

```haskell
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown(n - 1)
```

3. Deﬁne the exponentiation operator `^` for non-negative integers using the same pattern of recursion as the multiplication operator `*`, and show how the expression `2 ^ 3` is evaluated using your deﬁnition.

```haskell
(^) :: Int -> Int -> Int
m ^ 1 = m
m ^ n = m * (m ^ (n - 1))

-- 3 ^ 3
-- 3 * (3 ^ 2)
-- 3 * (3 * (3 ^ 1))
-- 3 * (3 * 3)
-- 27
```

4. Deﬁne a recursive function `euclid :: Int -> Int -> Int` that implements Euclid’s algorithm for calculating the greatest common divisor of two non-negative integers: if the two numbers are equal, this number is the result; otherwise, the smaller number is subtracted from the larger, and the same process is then repeated.

```haskell
euclid :: Int -> Int -> Int
euclid m n | m <= 0 || n <= 0 = error "invalid argument"
           | m == n = m
           | m < n = euclid m (n - m)
           | otherwise = euclid (m - n) n
```

5. Using the recursive deﬁnitions given in this chapter, show how the following functions are evaluated:

- `length [1,2,3]`

```haskell
length :: [a] -> Int
length [] = 0
length (_:xs) = 1 + length xs

-- length [1,2,3]
-- 1 + (length [2, 3])
-- 1 + (1 + (length [3]))
-- 1 + (1 + (1 + length[]))
-- 1 + (1 + 1 (0)
-- 3
```

- `drop 3 [1,2,3,4,5]`

```haskell
drop :: Int -> [a] -> [a]
drop 0 xs = xs
drop _ [] = []
drop n (_:xs) = drop (n-1) xs

-- drop 3 [1,2,3,4,5]
-- drop 2 [2,3,4,5]
-- drop 1 [3,4,5]
-- drop 0 [4,5]
-- [4,5]
```

- `init [1,2,3]`

```haskell
init :: [a] -> [a]
init [_] = []
init (x:xs) = x : init xs

-- init [1,2,3]
-- 1 : (init [2,3])
-- 1 : (2 : (init [3]))
-- 1: (2 : [])
-- [1,2]
```

6. Without looking at the deﬁnitions from the standard prelude, deﬁne the following library functions on lists using recursion.

- Decide if all logical values in a list are True: `and :: [Bool] -> Bool`

```haskell
and :: [Bool] -> Bool
and [] = True
and (x:xs) = x && and (xs)

-- and [True, True, False]
-- True && (and [True, False])
-- True && (True && (and [False]))
-- True && (True && (False && and []))
-- True && (True && (False && True))
-- True && (True && False)
-- True && False
-- False
```

- Concatenate a list of lists: `concat :: [[a]] -> [a]`

```haskell
concat :: [[a]] -> [a]
concat [[],[]] = []
concat [[a],[]] = [a]
concat [[],[a]] = [a]
concat xs (y:ys) = -- TODO
```

- Produce a list with n identical elements: `replicate :: Int -> a -> [a]`

```haskell
replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n a = a : replicate (n - 1) a

-- replicate 3 "x"
-- "x" : (replicate 2 "x")
-- "x" : ("x" : (replicate 1 "x"))
-- "x" : ("x" : ("x" : (replicate 0 "x")))
-- "x" : ("x" : ("x" : ([])))
-- ["x", "x", "x"]
```

- Select the nth element of a list: `(!!) :: [a] -> Int -> a`

```haskell
(!!) :: [a] -> Int -> a
(x:xs) !! 0 = x
(x:xs) !! n = xs !! (n-1)

-- [1,2,3,4,5] !! 2
-- [2,3,4,5] !! 1
-- [3,4,5] !! 0
-- 3
```

- Decide if a value is an element of a list: `elem :: Eq a => a -> [a] -> Bool`

```haskell
elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem e (x:xs) = if e == x then True else elem e xs

-- elem 3 [1,2,3,4,5]
-- elem 3 [2,3,4,5]
-- elem 3 [3,4,5]
-- True

-- elem 10 [1,2,3]
-- elem 10 [2,3]
-- elem 10 [3]
-- False
```

7. Deﬁne a recursive function `merge :: Ord a => [a] -> [a] -> [a]` that merges two sorted lists to give a single sorted list.

```haskell
merge :: Ord a => [a] -> [a] -> [a]
-- TODO
```

8. Using merge, deﬁne a function `msort :: Ord a => [a] -> [a]` that implements merge sort , in which the empty list and singleton lists are already sorted, and any other list is sorted by merging together the two lists that result from sorting the two halves of the list separately.

Hint: ﬁrst deﬁne a function `halve :: [a] -> ([a],[a])` that splits a list into two halves whose lengths diﬀer by at most one.

```haskell
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
            where n = length xs `div` 2

msort :: Ord a => [a] -> [a]
-- TODO
```

9. Using the ﬁve-step process, construct the library functions that:

- calculate the sum of a list of numbers

```haskell
sum :: [Int] -> Int
sum [] = 0
sum (n:ns) = n + sum ns
```

- take a given number of elements from the start of a list

```haskell
take :: Int -> [a] -> [a]
take _ [] = []
take 0 xs = []
take n (x:xs) = x : take (n-1) xs
```

- select the last element of a non-empty list.

```haskell
last :: [a] -> a
last [x] = x
last (x:xs) = last xs
```
