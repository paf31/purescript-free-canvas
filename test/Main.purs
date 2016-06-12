module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Data.Maybe (fromJust)
import Graphics.Canvas (CANVAS, getCanvasElementById, getContext2D)
import Graphics.Canvas.Free (putImageData, getImageData, stroke, closePath, lineTo,
                            moveTo, beginPath, translate, strokeText, measureText,
                            setFont, rotate, scale, setStrokeStyle, setShadowColor,
                            setShadowOffsetY, setShadowOffsetX, setLineWidth, runGraphics)
import Partial.Unsafe (unsafePartial)

main :: Eff (canvas :: CANVAS) Unit
main = do
  canvas <- getCanvasElementById "canvas"
  context <- getContext2D (unsafePartial (fromJust canvas))

  runGraphics context $ do
    setLineWidth 2.0
    setShadowOffsetX 1.0
    setShadowOffsetY 1.0
    setShadowColor "#808080"
    setStrokeStyle "#FF8000"

    translate 20.0 20.0

    scale 2.0 1.5
    rotate 0.2

    let text = "Canvas!"

    setFont "48px Serif"
    m <- measureText text
    strokeText text 0.0 48.0

    translate m.width 0.0

    beginPath
    moveTo 0.0 0.0
    lineTo 50.0 0.0
    lineTo 25.0 50.0
    closePath
    stroke

    image <- getImageData 0.0 0.0 600.0 600.0
    putImageData image 0.0 200.0
