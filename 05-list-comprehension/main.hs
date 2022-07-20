squared_sum :: Int -> Int
squared_sum k = sum [n^2 | n <- [1..k]]

grid :: Int -> Int -> [(Int,Int)]
grid m n = [(x, y) | x <- [0..m], y <- [0..n]]

square :: Int -> [(Int, Int)]
square n = [(x, y) | x <- [0..n], y <- [0..n], x /= y]

myReplicate :: Int -> a -> [a]
myReplicate n k = [k | _ <- [0..n - 1]]

pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]
