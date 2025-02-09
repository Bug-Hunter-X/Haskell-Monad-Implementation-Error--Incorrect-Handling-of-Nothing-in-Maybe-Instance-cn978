# Haskell Monad Implementation Bug

This repository demonstrates a common error in Haskell when implementing custom Monad instances, specifically the incorrect handling of the `Nothing` case in the `Maybe` monad.

## Bug Description

The `bug.hs` file contains a flawed implementation of the `MyMonad` class, with instances for lists and `Maybe`. The `Maybe` instance's `(>>=)` operator doesn't correctly handle the `Nothing` case, leading to compilation errors when using `Nothing` in a monadic chain.

## Solution

The `bugSolution.hs` file provides a corrected implementation of the `Maybe` instance's `(>>=)` operator.  The corrected implementation ensures that `Nothing >>= f` always results in `Nothing`, correctly adhering to the monad laws.