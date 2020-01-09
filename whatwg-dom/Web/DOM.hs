module Web.DOM where

import Prelude hiding (undefined, null)
import Language.JavaScript.Prim
import Language.JavaScript.Foreign
import Asterius.Types
import Web.DOM.Types

toMaybe :: Foreign a => a -> Maybe a
toMaybe a
  | (untyped a) == null = Nothing
  | (untyped a) == undefined = Nothing
  | otherwise = Just a

window :: IO (Maybe Window)
window = do
  w <- js_window
  pure $ Window <$> toMaybe w


foreign import javascript "window" js_window :: IO JSObject
