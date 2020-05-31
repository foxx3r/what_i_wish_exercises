{-# LANGUAGE ApplicativeDo #-}

test :: Applicative m => m (a, b, c)
test = do
    a <- getLine
    b <- getLine
    c <- getLine
    return (a, b, c)

{-
    it will be after,
    desugared as:
    test :: Applicative m => m (a, b, c)
    test = (,,) <$> getLine <*> getLine <*> getLine
-}
