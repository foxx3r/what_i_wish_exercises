{-# LANGUAGE DeriveFunctor #-}

data Tree a = Node a [Tree a]
    deriving (Show, Functor)

tree :: Tree Int
tree = fmap (*10) $ Node 1 [Node 2 [], Node 3 []]
