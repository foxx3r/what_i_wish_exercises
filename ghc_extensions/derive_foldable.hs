{-# LANGUAGE DeriveFoldable #-}

data RoseTree a = RoseTree a [RoseTree a]
    deriving (Show, Foldable)

data Tree a = Leaf a
            | Branch (Tree a) (Tree a)
            deriving (Show, Foldable)

rose :: Int
rose = foldl (\x y -> x * y) 1 $ RoseTree 5 [RoseTree 2 [], RoseTree 8 []]

tree :: Int
tree = foldl (+) 1 $ Branch (Branch (Leaf 6) (Branch (Leaf 10) (Leaf 18))) (Leaf 7)
