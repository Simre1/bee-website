module Main where

import Control.Monad
import Data.Functor.Identity
import Data.Text qualified as T
import Data.Text.Lazy qualified as TL
import Development.Shake
import Lucid (renderTextT)
import Optics.Core
import Page
import Pages qualified

main :: IO ()
main = shake shakeOptions $ do
  pages
  css

pages :: Rules ()
pages = forM_ Pages.pages $ \page -> do
  writeFile'
    ("out/" ++ (T.unpack $ page ^. #route) ++ ".html")
    (TL.unpack $ runIdentity $ renderTextT $ renderPage $ page)

css :: Rules ()
css = do
  action $ command_ [] "windicss" ["*/*.hs", "*/*/*.hs", "*/*/*/*.hs", "-o", "out/css.css"]
