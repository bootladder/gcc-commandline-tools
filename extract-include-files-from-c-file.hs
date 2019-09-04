import Data.List
import System.Environment
import Data.Char

main = do
  args <- getArgs
  if length args == 0
    then putStrLn "Need atleast 1 filename argument"
    else do

  mapM extractIncludeFiles args
  return ()


extractIncludeFiles filename = do

  fileContent <- readFile filename
  let
    fileLines = lines fileContent
    noWhiteSpaceLines = map (dropWhile isSpace) fileLines
    includeLines = filter (isPrefixOf "#include") noWhiteSpaceLines

  mapM putStrLn includeLines
