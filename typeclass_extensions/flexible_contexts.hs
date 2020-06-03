{-# LANGUAGE FlexibleContexts #-}

class MyClass a

-- without flexible instances, all contexts
-- must be type varuables
-- the following code
-- would be legal
instance MyClass a => MyClass (Either a b)

-- but, with flexible contexts
-- we can nest arbitrary types
-- the following would be illegal
instance (MyClass (Maybe a)) => MyClass (Either a b)
