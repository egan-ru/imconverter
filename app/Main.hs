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

		
		putStrLn "test text2";

		case length args of
			1 ->	putStrLn (Lang.translate GoodArgs LangEn);
			2 ->	putStrLn (Lang.translate GoodArgs LangEn);
			_ ->	putStrLn (Lang.translate WrongArgs LangEn);
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
