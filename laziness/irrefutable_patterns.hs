func = \(_:_) -> "hello"
-- λ func []
-- *** Exception: <interactive>:53:5-17: Non-exhaustive patterns in lambda
-- even with [], it will require a list
-- with at least a head and a tail

func' = \ ~(_:_) -> "hello"
-- λ func' []
-- "hello"

f :: (a, b) -> Int
f (a, b) = const 1 a
-- λ f undefined
-- *** Exception: <interactive>:53:5-17: Non-exhaustive patterns in function g

g :: (a, b) -> Int
g ~(a, b) = const 1 a
-- λ g undefined
-- 1

j :: Maybe t -> t
j ~(Just x) = x
-- even if it is Just, it is stucked on
-- its own type, that receives Maybe t
-- therefore, we can pass Nothing
-- but because we don't have a x value
-- it will return an error anyway
-- even whether it's irrefutable or not

k :: Maybe t -> t
k (Just x) = x
-- λ k Nothing
-- *** Exception: <interactive>:53:5-17: Non-exhaustive patterns in function k
-- λ j Nothing
-- *** Exception: <interactive>:19:1-15: Irrefutable pattern failed for pattern Just x
