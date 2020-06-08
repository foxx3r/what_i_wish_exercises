data DivError = NoDivZero | TooLarge deriving (Show)

safeDiv :: Float -> Float -> Either DivError Float
safeDiv _ 0 = Left NoDivZero
safeDiv x y = Right $ x / y
