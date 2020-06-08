import Control.Monad

class Applicative f => Alternative f where
    -- identity of <|>
    empty :: f a
    -- associative binary operation
    (<|>) :: f a -> f a -> f a
    -- one or more
    some  :: f a -> f [a]
    -- zero or more
    many  :: f a -> f [a]

-- optional :: Alternative f => f a -> f (Maybe a)

when :: (Alternative f, Monad f) => Bool -> f () -> f ()
when p s = if p then s else return ()

guard :: (Alternative f, MonadPlus f) => Bool -> f ()
guard True = pure ()
guard False = mzero

instance Alternative Maybe where
    empty = Nothing
    Nothing <|> r = r
    l <|> _ = l

instance Alternative [] where
    empty = []
    (<|>) = (++)
