{-# LANGUAGE NoMonomorphismRestriction #-}

module Good(foo, bar) where

-- if the eztension hadn't being specified
-- it would be
-- foo :: Integer -> Integer
-- but it is
-- foo :: Num a => a -> a
foo x y = x + y
bar = foo 1
bar 2.0
