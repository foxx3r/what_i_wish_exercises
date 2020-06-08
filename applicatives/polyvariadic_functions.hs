{-# LANGUAGE FlexibleInstances #-}

class Arg a where
    collect' :: [String] -> a

instance Arg (IO ()) where
    collect' acc = mapM_ putStrLn acc

instance Arg [String] where
    collect' acc = acc

instance (Show a, Arg r) => Arg (a -> r) where
    collect' acc = \x -> collect' (acc ++ [show x])

collect :: Arg t => t
collect = collect' []

example1 :: [String]
example1 = collect 'a' 2 3.0

example2 :: IO ()
example2 = collect () "foo" [1, 2, 3]

class StrReturnType r where
    retString :: String -> r

instance StrReturnType String where
    retString = id

instance (StrReturnType r) => StrReturnType (Char -> r) where
    retString s c = retString (s ++ [c])

str :: (StrReturnType r) => r
str = retString ""
