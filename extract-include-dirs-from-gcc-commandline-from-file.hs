import Data.List
import System.Environment

main = do
  args <- getArgs
  if length args /= 1
    then putStrLn "Need 1 filename argument"
    else do

  fileContent <- readFile $ head args
  let 
    tokens = filter (isPrefixOf "-I") (words fileContent)
  
  mapM putStrLn tokens
  return ()
