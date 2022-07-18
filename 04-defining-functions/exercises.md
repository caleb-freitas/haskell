# Exercises

1. Using library functions, deﬁne a function halve :: [a] -> ([a],[a]) that splits an even-lengthed list into two halves

```haskell
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
            where n = length xs `div` 2
```

2. Deﬁne a function third :: [a] -> a that returns the third element in a list that contains at least this many elements using:
   a. head and tail;
   b. list indexing !!;
   c. pattern matching.

```haskell
third :: [a] -> a
-- head and tail
third xs = head(tail(tail xs))

-- list indexing !!
third xs = xs !! 2

-- pattern matching
third (_ : (_ : (k : _))) = k
```

3. Consider a function `safetail :: [a] -> [a]` that behaves in the same wayas tail except that it maps the empty list to itself rather than producing an error. Using tail and the function `null :: [a] -> Bool` that decides if a list is empty or not, deﬁne safetail using:
   a. a conditional expression;
   b. guarded equations;
   c. pattern matching.

```haskell
-- conditional expression
isEmpty :: [a] -> Bool
isEmpty xs = if length xs <= 0 then True else False

safetail :: [a] -> [a]
safetail xs = if isEmpty xs == True then [] else tail xs

-- guarded equations
isEmpty :: [a] -> Bool
isEmpty xs | length xs <= 0 = True
           | otherwise = False

safetail :: [a] -> [a]
safetail xs | isEmpty xs == True = []
            | otherwise = tail xs

-- pattern matching
TODO
```

4. In a similar way to && in section 4.4, show how the disjunction operator || can be deﬁned in four diﬀerent ways using pattern matching.

```haskell
-- first way
(||) :: Bool -> Bool -> Boll
True || True = True
True || False = True
False || True = True
False || False = False

-- second way
(||) :: Bool -> Bool -> Boll
False || False = False
True || _ = True

-- third way
(||) :: Bool -> Bool -> Boll
True || _ = True
False || b = b

-- fourth way
(||) :: Bool -> Bool -> Boll
TODO
```

5. Without using any other library functions or operators, show how the meaning of the following pattern matching deﬁnition for logical conjunction && can be formalised using conditional expressions:

```haskell
True && True = True
_ && _ = False
```

Hint: use two nested conditional expressions.
