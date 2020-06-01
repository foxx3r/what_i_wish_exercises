{-# LANGUAGE DeriveGeneric #-}

import GHC.Generics

 data List a = Cons a (List a) | Nil
    deriving (Generic)
