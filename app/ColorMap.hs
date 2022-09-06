{-# LANGUAGE ImportQualifiedPost #-}

module ColorMap where

import Control.Monad.State
import Data.Map  qualified as M
import Text.Read qualified as R

import Data
import Util

type ColorKey = Int
type ColorMap = M.Map ColorKey Color

colors :: ColorMap
colors = M.fromList $ zip [1..] [minBound..maxBound]

printColors :: StateT ColorMap IO ()
printColors = lPrint =<< get

colorMap :: StateT ColorMap IO ()
colorMap = do
    lPutStrLn "Color Map:"
    printColors
    
    lPutStr "Lookup color by key: "
    -- colorKey <- R.readMaybe <$> liftIO getLine
    lPrint 3
    let colorKey = Just 3
    case colorKey of
        Just key -> do
            cs <- get
            let color = M.lookup key cs
            case color of
                Just c  -> lPrint c
                Nothing -> lPutStrLn "Not found"
        _ -> lPutStr "Invalid input"
    
    modify $ M.delete 2
    modify $ M.delete 5
    modify $ M.delete 7
    printColors
    
    modify $ M.insert 2 White
    printColors

    lPutStrLn ""
