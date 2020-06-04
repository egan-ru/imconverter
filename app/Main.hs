module Main where

import Lib
import Options.Applicative
import System.Environment
import System.Exit

{-
 - exec start here
 -}
main :: IO () 
main = do {
		args <- getArgs :: IO [String];
		let cnt = length args:: Int;
		in putStrLn(if 2 == cnt then parse args else "to be done")
}

{-
 - get command line args and fill string with
 - special format:
 - 1arg= %first_arg, 2arg= %second_arg
 - 
 - @param args		- input array of strings
 - @return		- formatted out  
-}
parse :: [String] -> String
parse args = let {
	str1 = args !! 0 :: String;
	str2 = args !! 1 :: String;
	result = "1arg= "++ str1  ++ ", 2arg= " ++ str2:: String;
} in result

