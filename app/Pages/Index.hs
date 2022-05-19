module Pages.Index where

import Lucid
import Page

page :: Page
page = Page {title = "Index", content = combinedSlides, route = "index"}


combinedSlides :: Html ()
combinedSlides = do
    div_ [class_ "bg-hex-b2a8bb"] $ mconcat slides

slides :: [Html ()]
slides = ["Slide 1", "Slide 2"]