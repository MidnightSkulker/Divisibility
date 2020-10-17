{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Lib

main :: IO ()
main = do
  putStrLn $ "Hello World: " ++ show (digits 7463)
  putStrLn $ "93457983475984 is divisible by 2: " ++ show (divisibleByTwo 93457983475984)
  putStrLn $ "93457983475985 is divisible by 2: " ++ show (divisibleByTwo 93457983475985)
  putStrLn $ "Sums of digits of 387483402019012987654321: " ++ show (sumsOfDigits 30 387483402019012987654321)
  putStrLn $ "Sums of digits of 3636363636363636: " ++ show (sumsOfDigits 30 3636363636363636)
  putStrLn $ "387483402019012987654321 is divisible by 3: " ++ show (divisibleByThree 387483402019012987654321)
  putStrLn $ "3636363636363636 is divisible by 3: " ++ show (divisibleByThree 3636363636363636)

digits :: Integer -> [Integer]
digits = map (read . (:[])) . show

divisibleByTwo :: Integer -> Bool
divisibleByTwo = even . last . digits

sumsOfDigits :: Integer -> Integer -> [Integer]
sumsOfDigits limit i | i < limit = []
sumsOfDigits limit i =
  let current :: Integer = sum (digits i)
  in current:sumsOfDigits limit current

divisibleByThree :: Integer -> Bool
divisibleByThree i =
  let sums = sumsOfDigits 30 i
  in last sums `mod` 3 == 0
