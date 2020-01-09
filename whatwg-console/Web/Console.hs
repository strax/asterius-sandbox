module Web.Console (
    info',
    error',
    info,
    error
) where

import Asterius.Types
import Language.JavaScript.Foreign
import Language.JavaScript.Interop.Text
import Data.Text (Text)
import qualified Data.Text as Text
import Prelude hiding (error)

info :: Text -> IO ()
info = info' . textToJSString

info' :: Foreign a => a -> IO ()
info' = js_console_info . untyped

error :: Text -> IO ()
error = error' . textToJSString

error' :: Foreign a => a -> IO ()
error' = js_console_error . untyped

foreign import javascript "console.info('%o', ${1})" js_console_info :: JSVal -> IO ()
foreign import javascript "console.error('%o', ${1})" js_console_error :: JSVal -> IO ()
