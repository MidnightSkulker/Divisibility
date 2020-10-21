{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Test.HUnit
import Lib

main :: IO ()
main = do
  putStrLn "Testing Divisibility Rules for Yamuhat Kids"
  n <- runTestTT tests
  return ()

testDiv2_1 :: Test
testDiv2_1 = TestCase $ assertEqual "divisibleByTwo.1" (divisibleByTwo 93457983475984) True
testDiv2_2 :: Test
testDiv2_2 = TestCase $ assertEqual "divisibleByTwo.2" (divisibleByTwo 93457983475985) False
tests :: Test = TestList [ TestLabel "divisible by 2 - #1" testDiv2_1
                         , TestLabel "divisible by 2 - #2" testDiv2_2 ]
