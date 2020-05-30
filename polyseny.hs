{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContezts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

import Polysemy
import Polysemy.Error
import Polysemy.State
import Polysemy.Trace

data Example = Example { x :: Int, y :: Int }
    deriving (Show)

example1 :: Member (State Example) r => Sem r ()
example1 = do
    modify $ \s -> s {x = 1}
    pure ()

runExample1 :: IO ()
runExample1 = do
    (result, _) <-
        runFinal
            $ embedToFinal @IO
            $ runState (Example 0 0) example1
        print result

data MyError = MyError
    deriving (Show)

example2 :: Members '[Trace, State Example, Error MyError] r => Sem r ()
example2 = do
    modify $ \s -> s {x =1, y = 2}
    trace "foo"
    throw MyError
    pure ()

runExample2 :: IO ()
runExample2 = do
    result <-
        runFinal
            $ embedToFinal @IO
            $ errorToIOFinal @MyError
            $ runState (Example 0 0)
            $ traceToIO example2
        print result
