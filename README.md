# Module Documentation

## Module Graphics.Canvas.Free

### Types

    type Graphics a = FreeC GraphicsF a


### Values

    arc :: C.Arc -> Graphics Unit

    beginPath :: Graphics Unit

    clip :: Graphics Unit

    closePath :: Graphics Unit

    fill :: Graphics Unit

    fillText :: String -> Number -> Number -> Graphics Unit

    getImageData :: Number -> Number -> Number -> Number -> Graphics C.ImageData

    lineTo :: Number -> Number -> Graphics Unit

    measureText :: String -> Graphics C.TextMetrics

    moveTo :: Number -> Number -> Graphics Unit

    putImageData :: C.ImageData -> Number -> Number -> Graphics Unit

    rect :: C.Rectangle -> Graphics Unit

    restore :: Graphics Unit

    rotate :: Number -> Graphics Unit

    runGraphics :: forall a eff. C.Context2D -> Graphics a -> Eff (canvas :: C.Canvas | eff) a

    save :: Graphics Unit

    scale :: Number -> Number -> Graphics Unit

    setAlpha :: Number -> Graphics Unit

    setComposite :: C.Composite -> Graphics Unit

    setFillStyle :: String -> Graphics Unit

    setFont :: String -> Graphics Unit

    setLineCap :: C.LineCap -> Graphics Unit

    setLineWidth :: Number -> Graphics Unit

    setShadowBlur :: Number -> Graphics Unit

    setShadowColor :: String -> Graphics Unit

    setShadowOffsetX :: Number -> Graphics Unit

    setShadowOffsetY :: Number -> Graphics Unit

    setStrokeStyle :: String -> Graphics Unit

    stroke :: Graphics Unit

    strokeText :: String -> Number -> Number -> Graphics Unit

    transform :: C.Transform -> Graphics Unit

    translate :: Number -> Number -> Graphics Unit



