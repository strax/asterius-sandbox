module Language.JavaScript.Interop.Text
    ( textToJSString
    , jsStringToText ) where

import Asterius.Magic
import Asterius.Types
import Language.JavaScript.Interop.ByteString
import qualified Data.ByteString.Internal as ByteString
import Data.Text (Text)
import Data.Text.Encoding
import qualified Data.Text as Text
import Foreign.Ptr (Ptr)

{-# INLINE textToJSString #-}
textToJSString :: Text -> JSString
textToJSString = accursedUnutterablePerformIO . js_decodeUtf8ToString . byteStringToJS . encodeUtf8

{-# INLINE jsStringToText #-}
jsStringToText :: JSString -> Text
jsStringToText str = accursedUnutterablePerformIO $ do
    let n = js_string_length str
    bs <- ByteString.createUptoN (n * 3) $ \ptr -> js_storeStringAsUtf8 str ptr (n * 3)
    pure $ decodeUtf8 bs

foreign import javascript
    "(new TextDecoder('utf-8', { fatal: true })).decode(${1})"
    js_decodeUtf8ToString :: JSArrayBuffer -> IO JSString

foreign import javascript
    "${1}.length" js_string_length :: JSString -> Int

foreign import javascript
    "(new TextEncoder()).encodeInto(${1}, new Uint8Array(__asterius_jsffi.exports.memory.buffer, ${2} & 0xFFFFFFFF, ${3})).written"
    js_storeStringAsUtf8 :: JSString -> Ptr a -> Int -> IO Int
