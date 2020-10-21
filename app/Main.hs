{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Data.List (unfoldr)
import Lib

main :: IO ()
main = do

  putStrLn $ "387483402019012987654324 is divisible by 10: " ++ show (divisibleByTen 387483402019012987654324)
  putStrLn $ "36363636363636360 is divisible by 10: " ++ show (divisibleByTen 36363636363636360)

  putStrLn $ "387483402019012987654324 is divisible by 11: " ++ show (divisibleByEleven 387483402019012987654324)
  putStrLn $ "36363636363636362 is divisible by 11: " ++ show (divisibleByEleven 36363636363636362)

  putStrLn $ "387483402019012987654324 is divisible by 12: " ++ show (divisibleByTwelve 387483402019012987654324)
  putStrLn $ "36363636363636362 is divisible by 12: " ++ show (divisibleByTwelve 36363636363636362)
  putStrLn $ "387483402019012987654324 is divisible by 13: " ++ show (divisibleByThirteen 387483402019012987654324)
  putStrLn $ "36363636363636361 is divisible by 13: " ++ show (divisibleByThirteen 36363636363636361)
