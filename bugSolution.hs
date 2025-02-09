{-# LANGUAGE FlexibleInstances #-}

module Main where

class MyMonad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

instance MyMonad [] where
  return x = [x]
  xs >>= f = concatMap f xs

instance MyMonad Maybe where
  return x = Just x
  Nothing >>= _ = Nothing
  Just x >>= f = f x

main :: IO ()
main = do
  let result1 = return 1 >>= (\x -> return (x + 1))
  let result2 = return [1,2,3] >>= (\xs -> return (map (+1) xs))
  let result3 = Nothing >>= (\x -> return (x + 1))
  print result1  -- prints Just 2
  print result2 -- prints Just [2,3,4]
  print result3  -- prints Nothing