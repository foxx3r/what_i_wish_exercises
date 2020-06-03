{-# LANGUAGE StrictData #-}

import qualified Data.Text as T

data  Employee = Employee
    { name :: T.Text
    , age  :: Int }

{- 
    it will be desugared as
    data Employee = Employee
        { name :: !T.Text
        , age  :: !Int }
-}
