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

_sum :: Num a => [a] -> a
_sum [] = 0
_sum (n:ns) = n + _sum ns
