#!/usr/bin/env runhaskell

import Data.List
import System.Environment
main = do
  args <- getArgs
  if length args /= 2
    then putStrLn "Need 2 filename arguments"
    else do

  file1 <- readFile $ head args
  file2 <- readFile $ args !! 1
  let
      f1 = filter (not . isPrefixOf "-I")
      f2 = filter (not . isSuffixOf ".o")
      filterTokens = f2 . f1
      diffTokens l1 l2 = filter (\x -> not $ elem x l2) l1

      filteredTokens1 = filterTokens $ words file1
      filteredTokens2 = filterTokens $ words file2
      t1 = diffTokens filteredTokens1 filteredTokens2
      t2 = diffTokens filteredTokens2 filteredTokens1

  putStrLn "Tokens in 1, not in 2"
  mapM putStrLn t1
  putStrLn "\n\nTokens in 2, not in 1"
  mapM putStrLn t2
  return ()
