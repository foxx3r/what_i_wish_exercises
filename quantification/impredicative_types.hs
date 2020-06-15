{-# LANGUAGE ImpredicativeTypes #-}

-- can't unify (int ~ char)
revUni :: Maybe (forall a. [a] -> a) -> Maybe (Int, Char)
revUni (Just g) = Just (g [3], g "hello")
revUni Nothing = Nothing

f :: (forall a. [a] -> a) -> (Int, Char)
f get = (get [1, 2], get ['a', 'b', 'c'])

g :: Maybe (forall a. [a] -> a) -> (Int, Char)
g Nothing = (0, '0')
g (Just get) = (get [1, 2], get ['a', 'b', 'c'])
