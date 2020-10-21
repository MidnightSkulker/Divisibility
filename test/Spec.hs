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
testDiv3_1 :: Test
testDiv3_1 = TestCase $ assertEqual "divisibleByThree.1" (divisibleByThree 387483402019012987654321) False
testDiv3_2 :: Test
testDiv3_2 = TestCase $ assertEqual "divisibleByThree.2" (divisibleByThree 3636363636363636) True

tests :: Test = TestList [ TestLabel "divisible by 2 - #1" testDiv2_1
                         , TestLabel "divisible by 2 - #2" testDiv2_2
                         , TestLabel "divisible by 3 - #1" testDiv3_1
                         , TestLabel "divisible by 3 - #2" testDiv3_2
                         ]
