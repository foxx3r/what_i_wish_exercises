{-# LANGUAGE TupleSections #-}

first :: a -> (a, Bool)
first = (, True)

second :: a -> (Bool, a)
second = (True,)

f :: t3 -> t2 -> t1 -> t -> (t3, (), t2, (), (), t1, t)
f = (, (),, (), (),,)
