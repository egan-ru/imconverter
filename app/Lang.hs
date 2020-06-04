module Lang(
{-
 - translate friendly name into string
 - param name	- friendly name
 - return	- localizated string
 -}
	translate,

{- contain friendly names of common phrases -}
	TextData(..)

)where

import Lib
import Data.Map.Strict

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

{-
 - translate friendly name into string
 - param name	- friendly name
 - return	- localizated string
 -}
translate :: TextData -> [Char]
translate name = textEn ! name;


