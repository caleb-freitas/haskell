-- calculate the double of a number
double n = n + n

-- calculate the quadruple of a number
quadruple n = double (double n)

-- calculate the factorial of a positive integer
factorial n = product[1..n]

-- calculate the average of a list of integer
average ns = sum ns `div` length ns
-- average ns = div (sum ns) (length ns)

-- get the last item of a non empty list (exercise 4)
my_last ns = head (reverse ns)

-- remove the last item of a non empty list (exercise 5)
my_init ns = reverse (tail (reverse ns))
my_init_drop ns = reverse (drop 1 (reverse ns))
