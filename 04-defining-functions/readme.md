# Chapter 4: Defining Functions

1. Using library functions, deﬁne a function `halve :: [a] -> ([a],[a])` that splits an even-lengthed list into two halves

```haskell
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
            where n = length xs `div` 2
```

2. Deﬁne a function `third :: [a] -> a` that returns the third element in a list that contains at least this many elements using:

- head and tail;

```haskell
third :: [a] -> a
third xs = head(tail(tail xs))
```

- list indexing !!;

```haskell
third :: [a] -> a
third xs = xs !! 2
```

- pattern matching.

```haskell
third :: [a] -> a
third (_ : (_ : (k : _))) = k
```

3. Consider a function `safetail :: [a] -> [a]` that behaves in the same wayas tail except that it maps the empty list to itself rather than producing an error. Using tail and the function `null :: [a] -> Bool` that decides if a list is empty or not, deﬁne safetail using:

- a conditional expression;

```haskell
safetail xs = if null xs then [] else tail xs
```

- guarded equations;

```haskell
safetail :: [a] -> [a]
safetail xs | null xs = []
            | otherwise = tail xs
```

- pattern matching.

```haskell
-- empty list case
safetail [] = []

-- non-empty list case
safetail (_:xs) = xs
```

4. In a similar way to && in section 4.4, show how the disjunction operator || can be deﬁned in four diﬀerent ways using pattern matching.

```haskell
-- truth table
(||) :: Bool -> Bool -> Bool
True || True = True
True || False = True
False || True = True
False || False = False

-- wildcard pattern
(||) :: Bool -> Bool -> Bool
False || False = False
_ || _ = True

-- pattern matching
(||) :: Bool -> Bool -> Bool
True || _ = True
False || b = b

-- guarded equations
(||) :: Bool -> Bool -> Bool
p || q | p == True = True
       | q == True = True
       | otherwise = False
```

5. Without using any other library functions or operators, show how the meaning of the following pattern matching deﬁnition for logical conjunction && can be formalised using conditional expressions:

```haskell
True && True = True
_ && _ = False
```

```haskell
(&&) :: Bool -> (Bool -> Bool)
p && q = if p == True then
           if q == True then True
           else False
          else False
```

6. Do the same for the following alternative deﬁnition, and note the diﬀerence in the number of conditional expressions that are required:

```haskell
True && b = b
False && _ = False
```

```haskell
(&&) :: Bool -> (Bool -> Bool)
p && q = if p == True then q
         else False
```

The number of conditional expressions is less than the previous one, given the fact that the preposition `q` does not need to be evaluated when the preposition `p` is `True`.

7. Show how the meaning of the following curried function deﬁnition can be formalised in terms of lambda expressions:

```haskell
mult :: Int -> Int -> Int -> Int
mult x y z = x*y*z
```

```haskell
mult :: Int -> (Int -> (Int -> Int))
mult = \x -> (\y -> (\z -> x * y * z))
```

8. Solution left to the next chapter, where a more general solution of Luhn Algorithm is exposed.
