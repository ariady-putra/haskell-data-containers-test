{-# LANGUAGE ImportQualifiedPost, OverloadedStrings #-}

module Main where

import Control.Monad.State

import Data.Char
import Data.Text qualified as T

import System.IO

import ColorMap as MapOf
import ColorSeq as SeqOf
import ColorSet as SetOf

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    
    evalStateT colorMap MapOf.colors
    evalStateT colorSeq SeqOf.colors
    evalStateT colorSet SetOf.colors
    
    putStrLn $ T.unpack $ T.map toUpper "Goodbye!"
