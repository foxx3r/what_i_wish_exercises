{-# LANGUAGE EmptyDataDecls #-}

import Data.Void
import Data.Text

data Foo tag a = Foo a

combine :: Num a => Foo tag a -> Foo tag a -> Foo tag a
combine (Foo a) (Foo b) = Foo (a + b)

a :: Foo () Int
a = Foo 1

b :: Foo t Int
b = Foo 1

c :: Foo Void Int
c = Foo 1

-- () ~ ()
example1 :: Foo () Int
example1 = combine a a

-- t ~ ()
example2 :: Foo () Int
example2 = combine a b

-- t0 ~ t1
example3 :: Foo t Int
example3 = combine b b

-- Couldn't match type 't' with type 'Void'
-- example4 :: Foo t Int
-- example4 = combine b c

data Cryptotext
data Plaintext

data Msg a = Msg Text

encrypt :: Msg Plaintext -> Msg Cryptotext
encrypt = undefined

decrypt :: Msg Cryptotext -> Msg Plaintext
decrypt = undefined

data Token a
