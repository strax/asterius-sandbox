module Web.DOM.Window where

import Web.DOM.Types
import Control.Monad.IO.Class

document :: MonadIO m => Window -> m (Maybe Document)
document = undefined
