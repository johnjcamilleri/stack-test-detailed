module Detailed where

import MyModule (myFunction)
import Distribution.TestSuite

tests :: IO [Test]
tests = return
  [ Test $ TestInstance
    { run = return $ Finished $ if myFunction == 1 then Pass else Fail "not equal 1"
    , name = "my test"
    , Distribution.TestSuite.tags = []
    , options = []
    , setOption = \opt val -> Left "options not supported"
    }
  ]
