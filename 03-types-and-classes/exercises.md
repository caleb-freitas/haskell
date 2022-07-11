# Exercises

1. What are the types of the following values?

```haskell
[Char]
(Char)
[(Bool, Char)]
([Bool], [Char])
[[a] -> [a]]
```

2. Write down deﬁnitions that have the following types; it does not matter what the deﬁnitions actually do as long as they are type correct.

```haskell
bools :: [Bool]
bools bs = reverse bs

nums :: [[Int]]
nums = [[1..10], [2..20]]

add :: Int -> Int -> Int -> Int
add a b = a + b

copy :: a -> (a,a)
copy s = (s, s)

apply :: (a -> b) -> a -> b
apply f x = f (f x)
```

3. What are the types of the following functions? Hint: take care to include the necessary class constraints in the types if the
functions are deﬁned using overloaded operators.

```haskell
second :: [a] -> a
second xs = head (tail xs)

swap :: (a, b) -> (b, a)
swap (x,y) = (y,x)

pair :: a -> b -> (a, b)
pair x y = (x,y)

double :: Num a => a -> a
double x = x*2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (t -> t) -> t -> t
twice f x = f (f x)
```

4. Check your answers to the preceding three questions using GHCi.

Checked!

5. Why is it not feasible in general for function types to be instances of the Eq class? When is it feasible? Hint: two functions of the same type are equal if they always return equal results for equal arguments.

Because, in the first case, to check if two function are equal, videre licet, they always return equal results to equal arguments, all the arguments must be enumerated in order to check the output of each value. In this way, it is unfeasible to check function's equality.
