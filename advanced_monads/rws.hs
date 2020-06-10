import Control.Monad.RWS

type R = Int
type W = [Int]
type S = Int

computation :: RWS R W S ()
computation = do
    e <- ask
    a <- get
    let b = a + e
    tell [b]

example = runRWS computation 2 3
