module Language.JavaScript.Error (errorHandler) where

import Asterius.Types
import Control.Exception

errorHandler :: SomeException -> IO ()
errorHandler (SomeException e) = js_console_error $ toJSString $ displayException e

foreign import javascript "console.error(${1})" js_console_error :: JSString -> IO ()
foreign import javascript "new Error(${1})" js_Error_new :: JSString -> IO JSVal
