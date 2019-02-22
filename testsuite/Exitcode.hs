import MyModule (myFunction)
import System.Exit (exitSuccess, exitFailure)

main :: IO ()
main =
  if myFunction == 1
  then exitSuccess
  else exitFailure
