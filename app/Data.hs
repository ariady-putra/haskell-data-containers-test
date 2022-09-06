{-# LANGUAGE ImportQualifiedPost #-}

module Data where

import Data.Set qualified as S

data Color
    = Red
    | Green
    | Blue
    | Cyan
    | Magenta
    | Yellow
    | White
    | Black
    deriving (Show, Bounded, Enum, Eq, Ord)
