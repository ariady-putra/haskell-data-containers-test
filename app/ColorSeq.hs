module ColorSeq where

import Control.Monad.State
import Data.Sequence as S

import Data
import Util

type ColorSeq = S.Seq Color

colors :: ColorSeq
colors = S.fromList [minBound..maxBound]

printColors :: StateT ColorSeq IO ()
printColors = liftIO . print =<< get

toList :: Seq s -> [s]
toList s = foldMap
    (\ i ->
        case S.lookup i s of
            Just s  -> [s]
            Nothing -> [ ]
    )
    [0 .. S.length s]

colorSeq :: StateT ColorSeq IO ()
colorSeq = do
    lPutStrLn "Color Seq:"
    printColors
    
    modify $ S.deleteAt 1
    printColors
    
    modify $ S.drop 2
    printColors
    
    modify $ S.intersperse Green
    printColors
    
    modify $ S.reverse
    printColors
    
    modify $ S.sort
    printColors
    
    modify $ S.take 4
    printColors
    
    cs <- get
    let c1 = Red <| cs
        c2 = c1 |> Blue
        c3 = c1 >< c2
    lPrint $ toList c1
    lPrint $ toList c2
    lPrint $ toList c3
    
    lPutStrLn ""
