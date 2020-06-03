{-# LANGUAGE FlexibleInstances #-}

class MyClass a

-- in a normal code
-- it would be legal
instance MyClass (Maybe a)

instance MyClass (Maybe Int)
-- but it wouldn't be legal
-- and that's why we use
-- flexible instances
