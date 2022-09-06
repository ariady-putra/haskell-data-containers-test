{-# LANGUAGE FlexibleContexts, ImportQualifiedPost #-}

module ColorSet where

import Control.Monad.State

import Data.Function
import Data.Set qualified as S

import Data
import Util

type ColorSet = S.Set Color

colors :: ColorSet
colors = S.fromList [minBound..maxBound]

printColors :: StateT ColorSet IO ()
printColors = lPrint =<< get

isMemberOfColors :: (MonadState ColorSet cs) => Color -> cs Bool
isMemberOfColors = (<$> get) . S.member

colorSet :: StateT ColorSet IO ()
colorSet = do
    lPutStrLn "Color Set:"
    printColors
    
    lPutStr "Green is member of colors: "
    lPrint =<< (&) Green isMemberOfColors
    
    modify $ S.delete Magenta
    modify $ S.delete White
    modify $ S.delete Green
    printColors
    lPutStr "Green is member of colors: "
    lPrint =<< (&) Green isMemberOfColors
    
    modify $ S.insert White
    printColors
    
    let colorSet1 = S.fromList [Red, Green, Blue, White, Black]
        colorSet2 = S.fromList [Cyan, Magenta, Yellow, White, Black]
    lPutStr "Union of RGBWB & CMYWB         : "
    lPrint $ S.toList $ S.union        colorSet1 colorSet2
    lPutStr "Intersection of RGBWB & CMYWB  : "
    lPrint $ S.toList $ S.intersection colorSet1 colorSet2 -- colorSet1 & colorSet2
    lPutStr "Difference of RGBWB & CMYWB    : "
    lPrint $ S.toList $ S.difference   colorSet1 colorSet2 -- colorSet1 - colorSet2
    
    lPutStrLn ""
