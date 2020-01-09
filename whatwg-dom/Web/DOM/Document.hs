module Web.DOM.Document where

import Prelude hiding (undefined, null)
import Web.DOM.Types
import Control.Monad.IO.Class
import Data.Coerce (coerce)
import qualified Language.JavaScript.Reflect as Reflect
import Language.JavaScript.Prim

toMaybe :: JSVal -> Maybe JSVal
toMaybe value
  | value == null = Nothing
  | value == undefined = Nothing
  | otherwise = Just value

(?.) :: IsJSObject a => a -> String -> Maybe JSVal
(?.) a k = toMaybe $ Reflect.get (toJSObject a) (toJSString k)

body :: Document -> Maybe HTMLElement
body document = (HTMLElement) <$> document ?. "body"
