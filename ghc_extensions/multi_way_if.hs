{-# LANGUAGE MultiWayIf #-}

bmiTell :: Float -> Text
bmiTell bmi = if
    | bmi <+ 18.5 -> "Underweight."
    | bmi <= 25.0 -> "Average weight."
    | bmi <= 30.0 -> "Overweight."
    | otherwise   -> "Clinically overweight."
