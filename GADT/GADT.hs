{-# LANGUAGE GADTs #-}

-- Vanilla
-- data List a
--   = Empty
--   | Cons a (List a)

-- GADTs syntax
-- data List a where
--   Empty :: List a
--   Cons  :: a -> List a -> List a

-- data Term a
--   = Lit a
--   | Succ (Term a)
--   | IsZero (Term a)

-- can:t be well-typed
-- eval (Lit i) = i
-- eval (Succ t) = 1 + eval t
-- eval (IsZero i) = eval i == 0

-- this is valid
-- failure = Succ (Lit True)

data Term a where
  Lit    :: a -> Term a
  Succ   :: Term Int -> Term Int
  IsZero :: Term Int -> Term Bool
  If     :: Term Bool -> Term a -> Term a -> Term a
