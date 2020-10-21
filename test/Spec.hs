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
testDiv3_1 =
  TestCase $ assertEqual "divisibleByThree.1" (divisibleByThree 387483402019012987654321) False
testDiv3_2 :: Test
testDiv3_2 = TestCase $ assertEqual "divisibleByThree.2" (divisibleByThree 3636363636363636) True

testDiv4_1 :: Test
testDiv4_1 =
  TestCase $ assertEqual "divisibleByFour.1"  (divisibleByFour 387483402019012987654321) False
testDiv4_2 :: Test
testDiv4_2 = TestCase $ assertEqual "divisibleByFour.2" (divisibleByFour 3636363636363636) True

testDiv5_1 :: Test
testDiv5_1 =
  TestCase $ assertEqual "divisibleByFive.1" (divisibleByFive 387483402019012987654321) False
testDiv5_2 :: Test
testDiv5_2 = TestCase $ assertEqual "divisibleByFive.1" (divisibleByFive 3636363636363635) True

testDiv6_1 :: Test
testDiv6_1 =
  TestCase $ assertEqual "divisiblBySix.1" (divisibleBySix 387483402019012987654321) False

testDiv6_2 :: Test
testDiv6_2 = TestCase $ assertEqual "divisiblBySix.2" (divisibleBySix 3636363636363636) True

testDiv7_1 :: Test
testDiv7_1 =
  TestCase $ assertEqual "divisibleBySeven.1" (divisibleBySeven 387483402019012987654321) False
testDiv7_2 :: Test
testDiv7_2 = TestCase $ assertEqual "divisibleBySeven.1" (divisibleBySeven 36363636363636365) True

testDiv8_1 :: Test
testDiv8_1 =
  TestCase $ assertEqual "divisiblByEight.1" (divisibleByEight 387483402019012987654324) False

testDiv8_2 :: Test
testDiv8_2 = TestCase $ assertEqual "divisiblByEight.2" (divisibleByEight 3636363636363632) True

testDiv9_1 :: Test
testDiv9_1 =
  TestCase $ assertEqual "divisibleByNine.1" (divisibleByNine 387483402019012987654324) False
testDiv9_2 :: Test
testDiv9_2 = TestCase $ assertEqual "divisibleByNine.2" (divisibleByNine 3636363636363636) True


testDiv10_1 =
  TestCase $ assertEqual "divisibleByTen.1" (divisibleByTen 387483402019012987654324) False
testDiv10_2 :: Test
testDiv10_2 = TestCase $ assertEqual "divisibleByTen.2" (divisibleByTen 36363636363636360) True

testDiv11_1 :: Test
testDiv11_1 =
  TestCase $ assertEqual "divisibleByEleven.1" (divisibleByEleven 387483402019012987654324) False
testDiv11_2 :: Test
testDiv11_2 =
  TestCase $ assertEqual "divisibleByEleven.2" (divisibleByEleven 36363636363636362) True

testDiv12_1 :: Test
testDiv12_1 =
  TestCase $ assertEqual "divisibleByTwelve.1" (divisibleByTwelve 387483402019012987654324) False
testDiv12_2 :: Test
testDiv12_2 =
  TestCase $ assertEqual "divisibleByTwelve.2" (divisibleByTwelve 36363636363636372) True

testDiv13_1 :: Test
testDiv13_1 =
  TestCase $ assertEqual "divisibleByThirteen.1" (divisibleByThirteen 387483402019012987654324) False
testDiv13_2 :: Test
testDiv13_2 =
  TestCase $ assertEqual "divisibleByThirteen.2" (divisibleByThirteen 36363636363636361) True

tests :: Test = TestList [ TestLabel "divisible by 2 - #1" testDiv2_1
                         , TestLabel "divisible by 2 - #2" testDiv2_2
                         , TestLabel "divisible by 3 - #1" testDiv3_1
                         , TestLabel "divisible by 3 - #2" testDiv3_2
                         , TestLabel "divisible by 4 - #1" testDiv4_1
                         , TestLabel "divisible by 4 - #2" testDiv4_2
                         , TestLabel "divisible by 5 - #1" testDiv5_1
                         , TestLabel "divisible by 5 - #2" testDiv5_2
                         , TestLabel "divisible by 6 - #1" testDiv6_1
                         , TestLabel "divisible by 6 - #2" testDiv6_2
                         , TestLabel "divisible by 7 - #1" testDiv7_1
                         , TestLabel "divisible by 7 - #2" testDiv7_2
                         , TestLabel "divisible by 8 - #1" testDiv8_1
                         , TestLabel "divisible by 8 - #2" testDiv8_2
                         , TestLabel "divisible by 9 - #1" testDiv9_1
                         , TestLabel "divisible by 9 - #2" testDiv9_2
                         , TestLabel "divisible by 10 - #1" testDiv10_1
                         , TestLabel "divisible by 10 - #2" testDiv10_2
                         , TestLabel "divisible by 11 - #1" testDiv11_1
                         , TestLabel "divisible by 11 - #2" testDiv11_2
                         , TestLabel "divisible by 12 - #1" testDiv12_1
                         , TestLabel "divisible by 12 - #2" testDiv12_2
                         , TestLabel "divisible by 13 - #1" testDiv13_1
                         , TestLabel "divisible by 13 - #2" testDiv13_2
                         ]
