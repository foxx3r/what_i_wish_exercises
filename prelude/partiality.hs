{-# LANGUAGE TypeApplications #-}

headMay :: [a] -> Maybe a
head l = if length l > 0 then Just (l !! 0) else Nothing

readMay :: Read a => String -> Maybe a
readMay x = Just $ read x
-- ex: readMay @Int "3
