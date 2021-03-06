# Chapter 7: High-Order Functions

1. Show how the list comprehension `[f x | x <- xs, p x]` can be re-expressed using the higher-order functions `map` and `filter`.

```haskell
xpto :: (a -> b) -> (a -> Bool) -> [a] -> [b]
xpto f p = map f . filter p
```

2. Without looking at the deﬁnitions from the standard prelude, deﬁne the following higher-order library functions on lists:

- Decide if all elements of a list satisfy a predicate:

`all :: (a -> Bool) -> [a] -> Bool`

```haskell
all :: (a -> Bool) -> [a] -> Bool
all p xs = and . map p xs
```

- Decide if any element of a list satisﬁes a predicate:

```haskell
any :: (a -> Bool) -> [a] -> Bool
any p xs = or . map p xs
```

- Select elements from a list while they satisfy a predicate:

```haskell
take_while :: (a -> Bool) -> [a] -> [a]
take_while _ [] = []
take_while p (x:xs) | p x = x : take_while p xs
                    | otherwise = []
```

- Remove elements from a list while they satisfy a predicate:

```haskell
284
drop_while :: (a -> Bool) -> [a] -> [a]
drop_while _ [] = []
drop_while p (x:xs) | p x = drop_while p xs
                    | otherwise = x:xs
```

3. Redeﬁne the functions `map f` and `filter p` using `foldr`.

```haskell
map :: (a -> b) -> [a] -> [b]
map f xs = [f x | x <- xs]
map' f = foldr (\x xs -> f x : xs) []

filter :: (a -> b) -> [a] -> [b]
filter p xs = [x | x <- xs, p x]
filter' p = foldr (\x xs -> if p x then x:xs else xs) []
```

4. Using foldl, deﬁne a function `dec2int :: [Int] -> Int` that converts a decimal number into an integer.

```haskell
dec2int :: [Int] -> Int
dec2int = foldl (\x y -> 10*x + y) 0
```

5. Without looking at the deﬁnitions from the standard prelude, deﬁne the higher-order library function curry that converts a function on pairs into a curried function, and, conversely, the function uncurry that converts a curried function with two arguments into a function on pairs.

Hint: ﬁrst write down the types of the two functions.

6. A higher-order function unfold that encapsulates a simple pattern of recursion for producing a list can be deﬁned as follows:

```haskell
unfold p h t x | p x = []
               | otherwise = h x : unfold p h t (t x)
```

That is, the function unfold p h t produces the empty list if the predicate p is true of the argument value, and otherwise produces a non-empty list by applying the function h to this value to give the head, and the function t to generate another argument that is recursively processed in the same way to produce the tail of the list. For example, the function `int2bin` can be rewritten more compactly using `unfold` as follows:

`int2bin = unfold (== 0) (`mod` 2) (`div` 2)`

Redeﬁne the functions `chop8`, `map f` and `iterate f` using `unfold`.

7. Modify the binary string transmitter example to detect simple transmission errors using the concept of parity bits. That is, each eight-bit binary number produced during encoding is extended with a parity bit, set to one if the number contains an odd number of ones, and to zero otherwise. In turn, each resulting nine-bit binary number consumed during decoding is checked to ensure that its parity bit is correct, with the parity bit being discarded if this is the case, and a parity error being reported otherwise.

Hint: the library function `error :: String -> a` displays the given string as an error message and terminates the program; the polymorphic result type ensures that error can be used in any context.

8. Test your new string transmitter program from the previous exercise using a faulty communication channel that forgets the ﬁrst bit, which can be modelled using the `tail` function on lists of bits.

9. Deﬁne a function `altMap :: (a -> b) -> (a -> b) -> [a] -> [b]` that alternately applies its two argument functions to successive elements in a list, in turn about order.

10. Using `altMap`, deﬁne a function `luhn :: [Int] -> Bool` that implements the Luhn algorithm from the exercises in chapter 4 for bank card numbers of any length. Test your new function using your own bank card.
