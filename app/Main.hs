{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Data.List (unfoldr)

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

-- Test for reduceDigitsBy.
test1 :: Integer -> [Integer]
test1 i =
  let f :: [Integer] -> Integer
      f is = fromDigits (init is) - (2 * last is)
  in reduceDigitsBy f 100 i

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
divisibleBySeven i =
  let d = digits i
  in divisibleBySeven (fromDigits (init d) - (2 * last d))

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
