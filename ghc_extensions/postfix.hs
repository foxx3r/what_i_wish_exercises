{-# LANGUAGE PostfixOperators #-}

(!) :: Integer -> Integer
(!) n = product [1..n]

example :: Integer
example = (10!)
