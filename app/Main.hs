module Main where

import Lib
import Options.Applicative
import System.Environment
import System.Exit
import Lang
import Data.List.Split

{-
 - exec start here
 -}
main :: IO () 
main = do {
		args <- getArgs :: IO [String];

		let
			maybeFilenames = proceedArgs args;
			wrongArgsInfo = putStrLn(Lang.translate WrongArgs LangEn);
		in maybe wrongArgsInfo debugFunc maybeFilenames;

		{-fmap debugFunc (proceedArgs args) -}
{-
		case length args of
			1 ->	putStrLn (Lang.translate GoodArgs LangEn);
			2 ->	putStrLn (Lang.translate GoodArgs LangEn);
			_ ->	putStrLn (Lang.translate WrongArgs LangEn);
-}			


}

{- split filename into name and extension
 - @param String	- [in] filename to analyse
 - @return		- filename and extesion
 -}
filenameToNameExt :: String -> Maybe (String, String)
filenameToNameExt filename = isTwoStrings (splitOn "." filename)
	where { 	
		{- return two strings, if input is two string
		 - @param String	- [in] array of strings
		 - @return 		- maybe two strings
		 -} 
		isTwoStrings [str0, str1] = Just (str0, str1);
		isTwoStrings _ = Nothing;
	}

{- proceed args,
 - to make possible word with files
 - @param count		- arg count
 - @param lang		- lang to print message
 -
 - @return		- input filename and output filename
 -}
proceedArgs :: [String] -> Maybe (String, String)
{- two valid args -}
proceedArgs [infile, outfile] = do
	nameExtInfile <- filenameToNameExt infile
	nameBmpInfile <- extIsBmp nameExtInfile
	Just (infile, outfile)
{- one valid arg -}					
proceedArgs [infile] = do
	nameExt <- filenameToNameExt infile
	nameBmp <- extIsBmp nameExt
	Just (makeOutName nameBmp)
	where
		makeOutName (name, _ext) = (infile, name ++ ".out");
{- wrong arg count -}
proceedArgs _ =	Nothing;

{- check that extension is "bmp
 - @param (name, ext)	- name and extension
 - @return 		- name and extension, if extension is bmp
 -}
extIsBmp :: (String, String) -> Maybe (String, String)
extIsBmp (name, "bmp") = Just (name, "bmp");
extIsBmp (name, _ext) = Nothing;


{- debuf function
 - @param	- todo
 - @return	- todo
 - -}
debugFunc :: (String, String) -> IO ()
debugFunc (infile, outfile) = putStrLn (infile ++ " " ++ outfile);
