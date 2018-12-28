main = do
  file <- readFile "input.txt"
  let gcclines = lines file
  mapM printTokensOfLine gcclines

printTokensOfLine = printTokens . words

printTokens [] = return ()
printTokens (x:xs) =
  do
    putStrLn x
    printTokens xs


