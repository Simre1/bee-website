module Page where

import Lucid
import Data.Text
import GHC.Generics
import Optics.Core
import Data.String

data Page = Page {
    title :: Text,
    content :: Html (),
    route :: Text
} deriving Generic

renderPage :: Page -> Html ()
renderPage page = do
    html_ $ do
        head_ $ do
            link_ [href_ "css.css", rel_ "stylesheet"]
            title_ $ toHtml $ page ^. #title
        body_ $ do            
            page ^. #content