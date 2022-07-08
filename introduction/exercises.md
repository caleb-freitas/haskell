# Exercises

1. Give another possible calculation for the result of `double (double 2)`.

```haskell
double (double 2) =
= double 2 + double 2 =
= (2 + 2) + (2 + 2) =
= 8
```

2. Show that `sum [x] = x` for any number `x`.

```haskell
sum [x] = 
= x + sum [] =
= x + 0 =
= x
```

3. Deﬁne a function `product` that produces the product of a list of numbers, and show using your deﬁnition that `product [2, 3, 4] = 24`.
```haskell
product [] = 1
product (x:xs) = x * product(xs)

product [2, 3, 4] =
= 2 * (product[3, 4])
= 2 * (3 * product[4])
= 2 * (3 * (4 * product[]))
= 2 * (3 * (4 * 1))
= 24
```

4. How should the deﬁnition of the function qsort be modiﬁed so that it produces a reverse sorted version of a list?
```haskell
qsort (x : xs) = qsort longer ++ [x ] ++ qsort smaller
```
This change is enough to produces a reverse sorted version of a list, since the `larger` "sub-list" will occupy the first position in the first recursion.

5. What would be the eﬀect of replacing `<=` by `<` in the deﬁnition of qsort?
Hint: consider the example qsort [2, 2, 3, 1, 1].

Some numbers may be ignored, since the interval `a < x < b` it's not completely defined. This only works in the case where all the numbers are distinct from each other. In mathematical notation, we can say that this only works for the interval: `{a1, a2, ..., an | ai != aj for all i != j}`.
