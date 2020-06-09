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

{- proceed args,
 - to make possible word with files
 - @param count		- arg count
 - @param lang		- lang to print message
 -
 - @return		- todo: IO
 -}
proceedArgs :: [String] -> Maybe (String, String)
{- two valid args -}
proceedArgs [infile, outfile] = Just (infile, outfile);	
{- one valid arg -}					
proceedArgs [infile] = Just (infile, infile); 
{- wrong arg count -}
proceedArgs _ =	Nothing;

{- debuf function
 - @param	- todo
 - @return	- todo
 - -}
debugFunc :: (String, String) -> IO ()
debugFunc (infile, outfile) = putStrLn (infile ++ " " ++ outfile);
