# Chapter 2: First Steps

1. Work through the examples from this chapter using GHCi

Done!

2. Parenthesise the following numeric expressions

```haskell
(2^3)*4
(2*3)+(4*5)
2+(3*(4^5))
```

3. The script below contains three syntactic errors. Correct these errors and then check that your script works properly using GHCi

```haskell
n = a `div` length xs
    where
      a = 10
      xs = [1,2,3,4,5]
```

4. The library function `last` selects the last element of a non-empty list; for example, `last [1,2,3,4,5] = 5`. Show how the function `last` could be deﬁned in terms of the other library functions introduced in this chapter. Can you think of another possible deﬁnition?

```haskell
my_last ns = head (reverse ns)
```

5. The library function `init` removes the last element from a non-empty list; for example, `init [1,2,3 4,5] = [1,2,3,4]`. Show how `init` could similarly be deﬁned in two diﬀerent ways

```haskell
-- first way
my_init_tail ns = reverse (tail (reverse ns))

-- second way
my_init_drop ns = reverse (drop 1 (reverse ns))
```
