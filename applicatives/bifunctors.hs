class Bifunctor p where
    bimap  :: (a -> b) -> (c -> d) -> p a c -> p b d
    first  :: (a -> b) -> p a c -> p b c
    second :: (b -> c) -> p a b -> p a c

instance Bifunctor (,) where
    bimap func func' (x, y) = (func x, func' y)
    first func (x, y) = (func x, y)
    second func (x, y) = (x, func y)
