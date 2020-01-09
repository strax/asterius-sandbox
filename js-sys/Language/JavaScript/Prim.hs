{-# LANGUAGE NoImplicitPrelude, Strict #-}

module Language.JavaScript.Prim
  ( undefined
  , null
  , JSVal
  , JSString
  , JSObject
  , JSFunction
  , JSArrayBuffer
  , JSArray
  , IsJSObject(..)
  , Foreign(..)
  , toJSString ) where

import Prelude (id)
import Asterius.Types
import Language.JavaScript.Foreign (Foreign)
import Unsafe.Coerce (unsafeCoerce)
import Data.Bool
import Data.Eq

class Foreign a => IsJSObject a where
  toJSObject :: a -> JSObject

instance IsJSObject JSObject where
  toJSObject = id

{-# INLINE undefined #-}
undefined :: forall a. Foreign a => a
undefined = unsafeCoerce js_undefined

{-# INLINE null #-}
null :: JSVal
null = js_null

instance Eq JSVal where
  (==) = js_Object_is

foreign import javascript "undefined" js_undefined :: JSVal

foreign import javascript "null" js_null :: JSVal

foreign import javascript "Object.is(${1}, ${2})" js_Object_is :: JSVal -> JSVal -> Bool
