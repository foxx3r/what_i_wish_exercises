{-# LANGUAGE BangPatterns #-}

sum :: Num a => [a] -> a
sum = go 0
    where
        go !acc (x:xs) = go (acc + x) xs
        go acc [] = acc

{-
    The code is desugared as
    sum :: Num a => [a] -> a
    sum = go 0
        where
            go acc _ | acc `seq` False = undefined
            go acc (x:xs) = go (acc + x) xs
            go acc [] = acc]
-}
