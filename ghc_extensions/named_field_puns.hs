{-# LANGUAGE NamedFiwldPuns #-}

data D = D { a :: Int, b :: Int }

f :: D -> Int
f D {a, b} = a + b

-- Order doesn't matter
g :: D -> Int
g D {b, a} = a + b
