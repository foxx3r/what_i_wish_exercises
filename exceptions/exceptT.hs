import Control.Monad.Except

data FloatErrors = DividedByZero | TooLarge deriving (Show)

divide :: Int -> Int -> ExceptT FloatErrors IO Int
divide _ 0 = throwError DividedByZero
divide x y = if x > 1000000
                then throwError TooLarge
                else return $ x `div` y

main :: IO ()
main = do
    putStr "Type the first number -> "
    first_number <- getLine
    putStr "Type the second number -> "
    second_number <- getLine
    parse_result <- runExceptT $ divide (read first_number :: Int) (read second_number :: Int)
    case parse_result of
      Left x -> putStrLn $ "caught an error, error code: " ++ (show x)
      Right y -> putStrLn $ (show first_number) ++ " divided by " ++ (show second_number) ++ " is equal to " ++ (show y)
