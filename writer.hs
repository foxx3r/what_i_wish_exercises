import Control.Monad.Writer

type MyWriter = Writer [Int] String

example :: MyWriter
example = do
    tell [1..3]
    tell [3..5]
    return "foo"

output :: (String, [Int])
output = runWriter example
