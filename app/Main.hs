module Main where

import Lib
import Options.Applicative
import System.Environment
import System.Exit
import Lang

{-
 - exec start here
 -}
main :: IO () 
main = do {
		args <- getArgs :: IO [String];
		let cnt = length args:: Int;
		in if(2 == cnt) then 
			putStrLn (parse args);
			{- todo: exit success -}
			else
			putStrLn (Lang.translate WrongArgs);
			{- todo: exit fail wrong args  -}
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
