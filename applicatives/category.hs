{-# LANGUAGE NoImplicitPrelude #-}

import Prelude

class Category cat where
    id  :: cat a a
    (.) :: cat b c -> cat a b -> cat a c

instance Category (->) where
    id  = Prelude.id
    (.) = (Prelude..)

(<<<) :: Category cat => cat b c -> cat a b -> cat a c
(<<<) = (Main..)

(>>>) :: Category cat => cat a b -> cat b c -> cat a c
f >>> g = g Main.. f

class Category a => Arrow a where
    arr     :: (b -> c) -> a b c
    first   :: a b c -> a (b, d) (c, d)
    second  :: a b c -> a (d, b) (d, c)
    (***)   :: a b c -> a b' c' -> a (b, b') (c, c')
    (&&&)   :: a b c -> a b c'  -> a b (c, c')

instance Arrow (->) where
    arr f = f
    first f = f *** Main.id
    second f = Main.id *** f
    (***) f g ~(x, y) = (f x, g y)
