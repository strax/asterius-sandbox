module Language.JavaScript.Reflect
  ( apply
  , construct
  , construct'
  , get
  , ownKeys ) where

import Asterius.Types
import Prelude hiding (undefined)
import Language.JavaScript.Prim (undefined)

-- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/apply
{-# INLINE apply #-}
apply :: JSFunction -> JSVal -> JSArray -> IO JSVal
apply = js_Reflect_apply

construct :: JSFunction -> JSArray -> IO JSVal
construct target args = js_Reflect_construct target args undefined

construct' :: JSFunction -> JSArray -> JSFunction -> IO JSVal
construct' target args newTarget = js_Reflect_construct target args newTarget

get :: JSObject -> JSString -> JSVal
get = js_Reflect_get

ownKeys :: JSObject -> JSArray
ownKeys = js_Reflect_ownKeys

foreign import javascript
    "Reflect.apply(${1}, ${2}, ${3})"
    js_Reflect_apply :: JSFunction -> JSVal -> JSArray -> IO JSVal

foreign import javascript
    "Reflect.get(${1}, ${2})"
    js_Reflect_get :: JSObject -> JSString -> JSVal

foreign import javascript
    "Reflect.construct(${1}, ${2}, ${3})"
    js_Reflect_construct :: JSFunction -> JSArray -> JSFunction -> IO JSVal

foreign import javascript
    "Reflect.has(${1}, ${2})"
    js_Reflect_has :: JSObject -> JSVal -> Bool

foreign import javascript
    "Reflect.ownKeys(${1})"
    js_Reflect_ownKeys :: JSObject -> JSArray
