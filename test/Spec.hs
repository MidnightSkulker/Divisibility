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
testDiv4_1 :: Test
testDiv4_1 = TestCase $ assertEqual "divisibleByFour.1"  (divisibleByFour 387483402019012987654321) False
testDiv4_2 :: Test
testDiv4_2 = TestCase $ assertEqual "divisibleByFour.2" (divisibleByFour 3636363636363636) True
testDiv5_1 :: Test
testDiv5_1 = TestCase $ assertEqual "divisibleByFive.1" (divisibleByFive 387483402019012987654321) False
testDiv5_2 :: Test
testDiv5_2 = TestCase $ assertEqual "divisibleByFive.1" (divisibleByFive 3636363636363635) True

tests :: Test = TestList [ TestLabel "divisible by 2 - #1" testDiv2_1
                         , TestLabel "divisible by 2 - #2" testDiv2_2
                         , TestLabel "divisible by 3 - #1" testDiv3_1
                         , TestLabel "divisible by 3 - #2" testDiv3_2
                         , TestLabel "divisible by 4 - #1" testDiv4_1
                         , TestLabel "divisible by 4 - #2" testDiv4_2
                         , TestLabel "divisible by 5 - #1" testDiv5_1
                         , TestLabel "divisible by 5 - #2" testDiv5_2
                         ]
