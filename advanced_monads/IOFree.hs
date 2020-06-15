{-# LANGUAGE DeriveFunctor #-}

import Control.Monad.Free
import System.Exit

data Interaction x
    = Puts String x
    | Gets (Char -> x)
    | Exit
    deriving (Functor)

type IOFree a = Free Interaction a

puts :: String -> IOFree ()
puts s = liftF $ Puts s ()

get :: IOFree Char
get = liftF $ Gets id

exit :: IOFree r
exit = liftF Exit

gets :: IOFree String
gets = do
    c <- get
    if c == '\n'
       then return ""
       else gets >>= \line -> return (c:line)

-- Collapse IOFree into IO monad
interp :: IOFree a -> IO a
interp (Pure r) = return r
interp (Free x) = case x of
                    Puts s t -> putStr s >> interp t
                    Gets f -> getChar >>= interp . f
                    Exit -> exitSuccess

echo :: IOFree ()
echo = do
    puts "Enter your name: "
    str <- gets
    puts str
    if length str > 10
       then puts "\nYou have a long name.\n"
       else puts "\nYou have a short name.\n"
    exit

main :: IO ()
main = interp echo
