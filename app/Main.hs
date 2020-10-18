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
  putStrLn $ "387483402019012987654321 is divisible by 4: " ++ show (divisibleByFour 387483402019012987654321)
  putStrLn $ "3636363636363636 is divisible by 4: " ++ show (divisibleByFour 3636363636363636)
  putStrLn $ "387483402019012987654321 is divisible by 4: " ++ show (divisibleByFive 387483402019012987654321)
  putStrLn $ "3636363636363635 is divisible by 4: " ++ show (divisibleByFive 3636363636363635)
  putStrLn $ "387483402019012987654321 is divisible by 6: " ++ show (divisibleBySix 387483402019012987654321)
  putStrLn $ "3636363636363636 is divisible by 6: " ++ show (divisibleBySix 3636363636363636)

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
divisibleByThree i = last (sumsOfDigits 30 i) `mod` 3 == 0

last2 :: [a] -> [a]
last2 [] = []
last2 [a] = [a]
last2 as = [last (init as), last as]

last2Digits :: [Integer] -> Integer
last2Digits i =
  if length i >= 2
  then let [l1, l2] = last2 i
       in (10 * l1 + l2)
  else if length i == 1 then head i
  else 0
     
divisibleByFour :: Integer -> Bool
divisibleByFour i = last2Digits (digits i) `mod` 4 == 0

divisibleByFive :: Integer -> Bool
divisibleByFive i = last (digits i) `mod` 5 == 0

divisibleBySix :: Integer -> Bool
divisibleBySix i = divisibleByTwo i && divisibleByThree i
