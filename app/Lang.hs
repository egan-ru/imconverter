module Lang(
{-
 -
 - translate friendly name into string
 - @param name	- friendly name
 - @param lang	- lang name
 - @return	- localizated string
 -}
	translate,

{- contain friendly names of common phrases -}
	TextData(..),
	LangName(..)

)where

import Lib
import Data.Map.Strict

{- contain friendly names of langs -}
data LangName = 
	LangRu		|{- todo -}
	LangEn		{- todo -}
	deriving (Eq, Enum, Ord)

{- contain friendly names of common phrases -}
data TextData = 
	WrongArgs	|{- todo -}
	GoodArgs	|{- todo -}
	Help		 {- todo -}
	deriving (Eq, Enum, Ord)

{- contain phrases on Ru lang -}
textRu = fromList [
		(WrongArgs, "WrongArgs Text Ru"),
		(GoodArgs, "GoodArgs Text Ru"),
		(Help, "Help Text Ru")
		] :: Map TextData [Char]


{- contain phrases on En lang -}
textEn = fromList [
		(WrongArgs, "WrongArgs Text En"),
		(GoodArgs, "GoodArgs Text En"),
		(Help, "Help Text En")
		] :: Map TextData [Char]

{- container for texts -}
textAll = fromList[
		(LangEn, textEn),
		(LangRu, textRu)
		]
{-
 - translate friendly name into string
 - @param name	- text friendly name
 - @param lang	- lang name
 - @return	- localizated string
 -}
translate :: TextData-> LangName -> [Char]
translate name lang = (textAll ! lang) ! name;

