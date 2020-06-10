{-# LANGUAGE TypeApplications #-}

ex1 :: Maybe a
ex1 = fail @Maybe "error"

ex2 :: [a]
ex2 = fail @[] "error"

ex3 :: IO ()
ex3 = fail @IO "error"
