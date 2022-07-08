quicksort :: (Ord a) => [a] -> [a]
quicksort[] = []

quicksort(x:xs) = quicksort smaller ++ [x] ++ quicksort larger
              where
                smaller = [a | a <- xs, a <= x]
                longer = [b | b <- xs, b > x]

quicksort[3, 5, 1, 4, 2] -- [1, 2, 3, 4, 5]
