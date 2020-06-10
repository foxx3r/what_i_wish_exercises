{-# LANGUAGE DeriveAnyClass #-}

import Control.Monad.Exception

data Error = Empty deriving (Show, Exception)

main :: IO ()
main = do
    print 3
    throwIO Empty
    print 10
