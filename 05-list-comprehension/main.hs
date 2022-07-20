squared_sum :: Int -> Int
squared_sum k = sum [n^2 | n <- [1..k]]

grid :: Int -> Int -> [(Int,Int)]
grid m n = [(x, y) | x <- [0..m], y <- [0..n]]

square :: Int -> [(Int, Int)]
square n = [(x, y) | x <- [0..n], y <- [0..n], x /= y]

my_replicate :: Int -> a -> [a]
my_replicate n k = [k | _ <- [0..n - 1]]

pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfect :: Int -> Bool
perfect n = sum (init (factors n)) == n

perfects :: Int -> [Int]
perfects n = [k | k <- [1..n], perfect k]

scalar_product :: [Int] -> [Int] -> Int
scalar_product xs ys = sum [r * s | (r, s) <- zip xs ys]
