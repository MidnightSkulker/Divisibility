module Main where

import Test.HUnit
-- import Main(sumsOfDigits)

main :: IO ()
main = putStrLn "Test suite not yet implemented"

testFoo :: Test
testFoo = TestCase $ assertEqual "Should return 2" 5 2
