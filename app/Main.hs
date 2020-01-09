{-# LANGUAGE Strict #-}

module Main where

import Prelude hiding (putStrLn)
import Language.JavaScript.Foreign
import Language.JavaScript.Interop.Text
import Language.JavaScript.Error (errorHandler)
import Asterius.Types
import qualified Web.Console
import Data.Text.IO (putStrLn)
import Control.Exception

main' :: IO ()
main' = do
    let t = jsStringToText str1
    putStrLn t
    error "ouch"

main :: IO ()
main = catch main' errorHandler

foreign import javascript "'foobarbaz'" str1 :: JSString
