#!/usr/bin/env runhaskell

import Data.List
import System.IO
import Data.Char

main = do

  stdinInput <- getContents
  let 
    tokens = filter (isPrefixOf "-I") (words stdinInput)
  
  mapM putStrLn tokens
  return ()
