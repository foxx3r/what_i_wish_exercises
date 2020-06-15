{-# LANGUAGE RankNTypes #-}

import Control.Monad.ST

f `apply` x = f x

foo :: (forall s. ST s a) -> a
foo st = runST $ st

bar :: (forall s. ST s a) -> a
bar st = runST `apply` st
