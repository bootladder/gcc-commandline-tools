import Data.List
main = do
  file1 <- readFile "input1.txt"
  file2 <- readFile "input2.txt"
  let
      filterTokens = filter (not . isPrefixOf "-I")
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
