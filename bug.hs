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
  Nothing >>= f = Nothing
  Just x >>= f = f x

main :: IO ()
main = do
  let result1 = return 1 >>= (\x -> return (x + 1))
  let result2 = return [1,2,3] >>= (\xs -> return (map (+1) xs))
  print result1  -- prints Just 2
  print result2 -- prints Just [2,3,4]

  -- Problem:
  -- The following code will not compile because the instance for Maybe doesn't implement Monad correctly
  -- let result3 = Nothing >>= (\x -> return (x+1)) -- This line will cause a compile error
  -- The reason is that the Maybe instance should return Nothing instead of Just Nothing