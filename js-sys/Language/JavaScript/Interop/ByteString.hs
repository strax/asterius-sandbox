{-# LANGUAGE Strict #-}

module Language.JavaScript.Interop.ByteString ( byteStringToJS ) where

import Asterius.Magic
import Asterius.Types
import qualified Data.ByteString as ByteString
import Data.ByteString.Internal (ByteString(..))
import GHC.ForeignPtr (ForeignPtr(..))
import Foreign.ForeignPtr (withForeignPtr)
import Foreign.Ptr (Ptr, plusPtr)
import Data.Word (Word8)

{-# INLINE byteStringToJS #-}
byteStringToJS :: ByteString -> JSArrayBuffer
byteStringToJS (PS ptr offset size) = accursedUnutterablePerformIO $ slice ptr offset size

{-# INLINE slice #-}
slice :: ForeignPtr a -> Int -> Int -> IO JSArrayBuffer
slice ptr i n = withForeignPtr ptr $ \p -> js_arraybufferFromPtr (plusPtr p i) n

foreign import javascript
    "new Uint8Array(__asterius_jsffi.exports.memory.buffer, ${1} & 0xFFFFFFFF, ${2})"
    js_arraybufferFromPtr :: Ptr a -> Int -> IO JSArrayBuffer
