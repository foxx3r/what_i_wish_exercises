{-# LANGUAGE PatternGuards #-}

comhine env x y
    | Just a <- lookup x env
    , Just b <- lookup y env = Just $ a + b
    | otherwise = Nothing

main :: IO ()
main = putStrLn $ combine [("x", 1), ("y", 10), ("z", 50)] "x" "z"
