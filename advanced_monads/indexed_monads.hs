{-# LANGUAGE RebindableSyntax #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE NoMonomorphismRestriction #-}

import Data.IORef
import Data.Char
import Prelude hiding (fmap, (>>=), (>>), return)
import Control.Applicative

newtype IState i o a = IState { runIState :: i -> (a, o) }

evalIState :: IState i o a -> i -> a
evalIState st i = fst $ runIState st i

execIState :: IState i o a -> i -> o
execIState st i = snd $ runIState st i

ifThenElse :: Bool -> a -> a -> a
ifThenElse b i j = case b of
                     True -> i
                     False -> j

return :: a -> IState s s a
return a = IState $ \s -> (a, s)

fmap :: (a -> b) -> IState i o a -> IState i o b
fmap f v = IState $ \i -> let (a, o) = runIState v i
                            in (f a, o)

join :: IState i m (IState m o a) -> IState i o a
join v = IState $ \i -> let (w, m) = runIState v i
                        in runIState w m

(>>=) :: IState i m a -> (a -> IState m o b) -> IState i o b
v >>= f = IState $ \i -> let (a, m) = runIState v i
                            in runIState (f a) m

(>>) :: IState i m a -> IState m o b -> IState i o b
v >> w = v >>= \_ -> w

get :: IState s s s
get = IState $ \s -> (s, s)

gets :: (a -> o) -> IState a o a
gets f = IState $ \s -> (s, f s)

put :: o -> IState i o ()
put o = IState $ \_ -> ((), o)

modify :: (i -> o) -> IState i o ()
modify f = IState $ \i -> ((), f i)

data Locked = Locked
data Unlocked = Unlocked

type Stateful a = IState a Unlocked a

acquire :: IState i Locked ()
acquire = put Locked

release :: IState Locked Unlocked ()
release = put Unlocked

lockExample :: Stateful a
lockExample = do
    ptr <- get  :: IState a a a
    acquire     :: IState a Locked ()
    release     :: IState Locked Unlocked ()
    return ptr

{- failure1 :: Stateful a
failure1 = do
    ptr <- get
    acquire
    return ptr -}

{- failure2 :: Stateful a
failure2 = do
    ptr <- get
    release
    return ptr -}

evalReleased :: IState i Unlocked a -> i -> a
evalReleased f st = evalIState f st

example :: IO (IORef Integer)
example = evalReleased <$> pure lockExample <*> newIORef 0
