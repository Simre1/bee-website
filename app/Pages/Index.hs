module Pages.Index where

import Lucid
import Page

page :: Page
page = Page {title = "Index", content = combinedSlides, route = "index"}


combinedSlides :: Html ()
combinedSlides = do
    div_ [class_ "px-4"] $ mconcat slides

slides :: [Html ()]
slides = ["Slide 1", "Slide 2"]