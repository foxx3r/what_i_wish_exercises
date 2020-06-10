import Control.Monad.Except

data Error = Empty deriving (Show)

badFunction :: Except Error ()
badFunction = throwError Empty

main :: IO ()
main = do
    let caught_result = runExcept badFunction
    case caught_result of
      Left _ -> putStrLn "caught some error"
      Right _ -> putStrLn "no errors were caught"
