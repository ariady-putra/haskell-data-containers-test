module Util where

import Control.Monad.IO.Class

lPrint :: (Show s, MonadIO io) => s -> io ()
lPrint = liftIO . print

lPutStr :: (MonadIO io) => String -> io ()
lPutStr = liftIO . putStr

lPutStrLn :: (MonadIO io) => String -> io ()
lPutStrLn = liftIO . putStrLn
