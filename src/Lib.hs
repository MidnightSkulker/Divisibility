{-# LANGUAGE ScopedTypeVariables #-}
module Lib where

import Data.List (unfoldr)

-- Convert an Integer into a list of digitsn
digits :: Integer -> [Integer]
digits = map (read . (:[])) . show

-- Convert list of digits back into a single Integer
fromDigits :: [Integer] -> Integer
fromDigits = foldl addDigit 0 where addDigit num d = 10*num + d

-- Check if a number is divisible by 2, using the list of digits representation
divisibleByTwo :: Integer -> Bool
divisibleByTwo = even . last . digits

-- Recursively sum the digits of a number, until the last sum is less thant the limit.
-- For example:
--   sumsOfDigits 20 848484848484848482903029840983091231982301289 = [219,12]
-- So summing the digits of the long number gives 219,
-- and summing the digits of 219 gives 12.
sumsOfDigits :: Integer -> Integer -> [Integer]
sumsOfDigits limit i | i < limit = [i]
sumsOfDigits limit i = let s :: Integer = sum (digits i) in s:sumsOfDigits limit s

-- Reduce the digits iteratively by a function that reduced the integer a
-- little bit (or possibly more) at each stemp.
reduceDigitsBy :: ([Integer] -> Integer) -> Integer -> Integer -> [Integer]
reduceDigitsBy f limit i | i < limit = [i]
reduceDigitsBy f limit i =
  let next = f (digits i)
  in next:reduceDigitsBy f limit next

-- Test if a number is divisible by 3, using the list of digits representation.
divisibleByThree :: Integer -> Bool
divisibleByThree i = last (sumsOfDigits 30 i) `mod` 3 == 0

-- Get the last n elements of a list
lastN :: Int -> [a] -> [a]
lastN n as = drop (length as - n) as

-- Get the Integer value of the last three digits of an Integer.
-- For example: lastNDigits 3 (digits 92375490237354907549) = 549
lastNDigits :: Int -> [Integer] -> Integer
lastNDigits n i = fromDigits (lastN n i)

-- Test if a number is divisible by 4, using the list of digits representation.
divisibleByFour :: Integer -> Bool
divisibleByFour i = lastNDigits 2 (digits i) `mod` 4 == 0

-- Test if a number is divisible by 5, using the list of digits representation.
divisibleByFive :: Integer -> Bool
divisibleByFive i = last (digits i) `mod` 5 == 0

-- Test if a number is divisible by 6, using the list of digits representation.
divisibleBySix :: Integer -> Bool
divisibleBySix i = divisibleByTwo i && divisibleByThree i

-- Test is a number is divisible by 7, using the list of digits representation.
divisibleBySeven :: Integer -> Bool
divisibleBySeven i | i < 100 = i `mod` 7 == 0
divisibleBySeven i = last (inflateForSeven i) `mod` 7 == 0

-- Reduce the integer to be tested for divisibility by 7 by one application
-- of the rule for seven.
nextForSeven :: Integer -> Maybe (Integer, Integer)
nextForSeven j | j <= 70 = Nothing
nextForSeven j =
  let next = fromDigits (init (digits j)) - 2 * last (digits j)
  in  Just (next, next)

-- Produce all of the reduced integers for seven.
inflateForSeven :: Integer -> [Integer]
inflateForSeven i =unfoldr nextForSeven i

-- Test if a number is divisible by 8, using the list of digits representation.
divisibleByEight :: Integer -> Bool
divisibleByEight i = lastNDigits 3 (digits i) `mod` 8 == 0

-- Test if a number is divisible by 9, using the list of digits representation.
divisibleByNine :: Integer -> Bool
divisibleByNine i = last (sumsOfDigits 100 i) `mod` 9 == 0

-- Test if a number is divisible by 10, using the list of digits representation.
divisibleByTen :: Integer -> Bool
divisibleByTen i = last (digits i) == 0

-- Alternating Sum of Digits
alternatingSum :: [Integer] -> Integer
alternatingSum [] = 0
alternatingSum [x] = x
alternatingSum (x1:x2:xs) = x1 - x2 + alternatingSum xs

-- Test if a number is divisible by 11, using the list of digits representation.
divisibleByEleven :: Integer -> Bool
divisibleByEleven i = alternatingSum (digits i) `mod` 11 == 0

-- Test if a number is divisible by 12, using the list of digits representation.
divisibleByTwelve :: Integer -> Bool
divisibleByTwelve i = divisibleByThree i && divisibleByFour i

-- Reduce the integer to be tested for divisibility by 13 by one application
-- of the rule for seven.
nextForThirteen :: Integer -> Maybe (Integer, Integer)
nextForThirteen j | j <= 130 = Nothing
nextForThirteen j =
  let next = fromDigits (init (digits j)) - 9 * last (digits j)
  in  Just (next, next)

-- Produce all of the reduced integers for 13.
inflateForThirteen :: Integer -> [Integer]
inflateForThirteen i =unfoldr nextForThirteen i

-- Test is a number is divisible by 13, using the list of digits representation.
divisibleByThirteen :: Integer -> Bool
divisibleByThirteen i | i < 100 = i `mod` 13 == 0
divisibleByThirteen i = last (inflateForThirteen i) `mod` 13 == 0
