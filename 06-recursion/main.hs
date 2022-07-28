ackermann :: Integer -> Integer -> Integer
ackermann 0 n = n+1
ackermann m 0 = ackermann (m-1) 1
ackermann m n = ackermann (m-1) (ackermann m (n-1))

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) | x <= y = x : y : ys

isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

-- 1
factorial :: Int -> Int
factorial n | n <= 0 = 1
            | otherwise = n * factorial(n - 1)

-- 2
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown(n - 1)

-- 3
(^) :: Int -> Int -> Int
m ^ 1 = m
m ^ n = m * (m ^ (n - 1))

-- 3 ^ 3
-- 3 * (3 ^ 2)
-- 3 * (3 * (3 ^ 1))
-- 3 * (3 * 3)
-- 27

-- 4
euclid :: Int -> Int -> Int
euclid m n | m <= 0 || n <= 0 = error "invalid argument"
           | m == n = m
           | m < n = euclid m (n - m)
           | otherwise = euclid (m - n) n
