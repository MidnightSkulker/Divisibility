{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Data.List (unfoldr)
import Lib

main :: IO ()
main = do
  putStrLn $ "93457983475984 is divisible by 2: " ++ show (divisibleByTwo 93457983475984)
  putStrLn $ "93457983475985 is divisible by 2: " ++ show (divisibleByTwo 93457983475985)

  putStrLn $ "Sums of digits of 387483402019012987654321: " ++ show (sumsOfDigits 30 387483402019012987654321)
  putStrLn $ "Sums of digits of 3636363636363636: " ++ show (sumsOfDigits 30 3636363636363636)

  putStrLn $ "387483402019012987654321 is divisible by 3: " ++ show (divisibleByThree 387483402019012987654321)
  putStrLn $ "3636363636363636 is divisible by 3: " ++ show (divisibleByThree 3636363636363636)

  putStrLn $ "387483402019012987654321 is divisible by 4: " ++ show (divisibleByFour 387483402019012987654321)
  putStrLn $ "3636363636363636 is divisible by 4: " ++ show (divisibleByFour 3636363636363636)
  putStrLn $ "387483402019012987654321 is divisible by 5: " ++ show (divisibleByFive 387483402019012987654321)
  putStrLn $ "3636363636363635 is divisible by 5: " ++ show (divisibleByFive 3636363636363635)

  putStrLn $ "387483402019012987654321 is divisible by 6: " ++ show (divisibleBySix 387483402019012987654321)
  putStrLn $ "3636363636363636 is divisible by 6: " ++ show (divisibleBySix 3636363636363636)

  putStrLn $ "387483402019012987654321 is divisible by 7: " ++ show (divisibleBySeven 387483402019012987654321)
  putStrLn $ "36363636363636365 is divisible by 7: " ++ show (divisibleBySeven 36363636363636365)

  putStrLn $ "387483402019012987654324 is divisible by 8: " ++ show (divisibleByEight 387483402019012987654324)
  putStrLn $ "3636363636363632 is divisible by 8: " ++ show (divisibleByEight 3636363636363632)

  putStrLn $ "387483402019012987654324 is divisible by 9: " ++ show (divisibleByNine 387483402019012987654324)
  putStrLn $ "3636363636363636 is divisible by 9: " ++ show (divisibleByNine 3636363636363636)

  putStrLn $ "387483402019012987654324 is divisible by 10: " ++ show (divisibleByTen 387483402019012987654324)
  putStrLn $ "36363636363636360 is divisible by 10: " ++ show (divisibleByTen 36363636363636360)

  putStrLn $ "387483402019012987654324 is divisible by 11: " ++ show (divisibleByEleven 387483402019012987654324)
  putStrLn $ "36363636363636362 is divisible by 11: " ++ show (divisibleByEleven 36363636363636362)

  putStrLn $ "387483402019012987654324 is divisible by 12: " ++ show (divisibleByTwelve 387483402019012987654324)
  putStrLn $ "36363636363636362 is divisible by 12: " ++ show (divisibleByTwelve 36363636363636362)
  putStrLn $ "387483402019012987654324 is divisible by 13: " ++ show (divisibleByThirteen 387483402019012987654324)
  putStrLn $ "36363636363636361 is divisible by 13: " ++ show (divisibleByThirteen 36363636363636361)
