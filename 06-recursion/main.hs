merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x <= y then 
                        x : merge xs (y:ys) 
                      else 
                        y : merge (x:xs) ys

halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs) 
            where n = length xs `div` 2

msort :: Ord a => [a] -> [a]
msort [] = []
msort [a] = [a]
msort xs = merge (msort ys) (msort zs)
            where (ys, zs) = halve xs
