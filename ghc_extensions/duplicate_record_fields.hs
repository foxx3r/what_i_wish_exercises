{-# LANGUAGE DuplicateRecordFields #-}

data Person = Person { id :: Int } deriving (Show)
data Animal = Animal { id :: Int } deriving (Show)
data Vegetable = Vegetable { id :: Int } deriving (Show)

test :: (Person, Animal, Vegetable)
test = (Person {id = 1}, Animal {id = 2}, Vegetable {id = 3})
