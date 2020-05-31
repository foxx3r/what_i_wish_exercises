{-# LANGUAGE RecursiveDo #-}

justOnes :: Maybe [Int]
justOnes = do
    rec xs <- Just (1:xs)
    return (map negate xs)
