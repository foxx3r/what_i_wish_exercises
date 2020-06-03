class Equal a where
    (===), (!==) :: a -> a -> Bool
    x === y = not (x !== y)
    x !== y = not (x === y)
    {-# MINIMAL (===) | (!==) #-}
    -- if it was not defined
    -- then, a person would be able to implement
    -- this typeclass withoit minimal restrictions
    -- | means or and , means and
    -- if I had put a comma, so
    -- it will be obligatory to implement
    -- all of those functions in instances
    -- but I used not, so, if I implement
    -- ===, !== will be the negation of ===

instance Equal Int where
  0 !== 0 = False
  0 !== y = True
  x !== 0 = True
  x !== y = (x - 1) !== (y - 1)

data Light = Green | Yellow | Red

instance Equal Light where
    Green === Green = True
    Yellow === Yellow = True
    Red === Red = True
    _ === _ = False
