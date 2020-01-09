{-# LANGUAGE NoImplicitPrelude #-}

module Language.JavaScript.Foreign (Foreign(..)) where

import Asterius.Types
import Data.Coerce (Coercible, coerce)

class Foreign a where
  untyped :: a -> JSVal

  default untyped :: Coercible a JSVal => a -> JSVal
  untyped = coerce

instance Foreign JSVal
instance Foreign JSString
instance Foreign JSArray
instance Foreign JSArrayBuffer
instance Foreign JSObject
instance Foreign JSFunction
