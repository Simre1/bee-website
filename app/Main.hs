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
  action $ pages >> css

pages :: Action ()
pages = forM_ Pages.pages $ \page -> do
  writeFile'
    ("out/" ++ (T.unpack $ page ^. #route) ++ ".html")
    (TL.unpack $ runIdentity $ renderTextT $ renderPage $ page)

css :: Action ()
css = do
  htmlFiles <- getDirectoryFiles "" ["out/*.html", "out/*/*.html", "out/*/*/*.html"]
  command_ [] "windicss" $ ["-o", "out/css.css"] ++ htmlFiles
  

