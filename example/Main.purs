module Main where

import Graphics.Canvas (getCanvasElementById, getContext2D)
import Graphics.Canvas.Free

main = do
  canvas <- getCanvasElementById "canvas"
  context <- getContext2D canvas

  runGraphics context $ do
    setLineWidth 2
    setShadowOffsetX 1
    setShadowOffsetY 1
    setShadowColor "#808080"
    setStrokeStyle "#FF8000"
    
    translate 20 20
 
    scale 2.0 1.5
    rotate 0.2

    let text = "Canvas!"

    setFont "48px Serif"
    m <- measureText text
    strokeText text 0 48

    translate m.width 0

    beginPath
    moveTo 0 0
    lineTo 50 0
    lineTo 25 50
    closePath
    stroke

    image <- getImageData 0 0 600 600
    putImageData image 0 200
