module Web.DOM.Types
  ( Window(..), Document(..), DOMString(..), HTMLElement(..) ) where

import Language.JavaScript.Prim

newtype Window = Window JSObject deriving (Foreign, IsJSObject)
newtype Document = Document JSObject deriving (Foreign, IsJSObject)
newtype HTMLElement = HTMLElement JSVal deriving (Foreign) -- TODO: Convert to JSObject?
type DOMString = JSString
