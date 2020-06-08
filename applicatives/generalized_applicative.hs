import Control.Monad
import Control.Applicative

data C a b = C a b

mnd :: Monad m => m a -> mb -> m (C a b)
mnd a b = C `liftM` a `ap` b

apl :: Applicative f => f a -> f b -> f (C a b)
apl a b = C <$> a <*> b
