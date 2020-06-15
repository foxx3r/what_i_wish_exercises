{-# LANGUAGE RankNTypes #-}

-- can:t unify a with (Bool ~ Char)
-- rank1 :: forall a. (a -> a) -> (Bool, Char)
-- rank1 f = (f True, f 'a')

rank2 :: (forall a. a -> a) -> (Bool, Char)
rank2 f = (f True, f 'a')

auto :: (forall a. a -> a) -> (forall b. b -> b)
auto x = x

xauto :: forall a. (forall b. b -> b) -> a -> a
xauto f = f

-- forall a. a -> a would be forbidden
escape :: (forall a. a -> Int) -> Int
escape f = f 0

g x = escape (\a -> x)
