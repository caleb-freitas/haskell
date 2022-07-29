-- binary string transmitter
import Data.Char
import Data.List

type Bit = Int

-- base conversion using list comprehension
bin2int :: [Bit] -> Int
bin2int bits = sum [w*b | (w, b) <- zip weights bits]
                where weights = iterate (*2) 1

-- base conversion using folder
foldr_bin2int :: [Bit] -> Int
foldr_bin2int = foldr (\x y -> x + 2*y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

-- normalize digit length
make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

-- ord :: Char -> Int
-- encode the string
encode :: String -> [Bit]
encode = concat . map (make8 . int2bin . ord)

-- decode the string
chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

decode :: [Bit] -> String
decode = map (chr . bin2int) . chop8

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id

-- voting algorithm
-- first past the post

votes :: [String]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]

count :: Eq a => a -> [a] -> Int
count x = length . filter (== x)

rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/= x) (rmdups xs)

result :: Ord a => [a] -> [(Int, a)]
result vs = sort [(count v vs, v) | v <- rmdups vs]

winner :: Ord a => [a] -> a
winner = snd . last . result

-- alternative voting algorithm
ballots :: [[String]]
ballots = [["Red", "Green"],
          ["Blue"],
          ["Green", "Red", "Blue"],
          ["Blue", "Green", "Red"],
          ["Green"]]

rmempty :: Eq a => [[a]] -> [[a]]
rmempty = filter (/= [])

elim :: Eq a => a -> [[a]] -> [[a]]
elim x = map (filter (/= x))

rank :: Ord a => [[a]] -> [a]
rank = map snd . result . map head

winner' :: Ord a => [[a]] -> a
winner' bs = case rank (rmempty bs) of
              [c] -> c
              (c:cs) -> winner' (elim c bs)
