import Control.Monad.State

test :: State Int Int
test = do
    put 3
    modify (+1)
    get

example :: IO ()
example = print $ execState test 0

test2 :: State Int Int
test2 = do
    modify (*2)
    s <- get
    return s

example2 :: IO ()
example2 = print $ execState test 5
