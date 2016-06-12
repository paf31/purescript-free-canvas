## Module Graphics.Canvas.Free

#### `GraphicsF`

``` purescript
data GraphicsF more
```

#### `GraphicsT`

``` purescript
type GraphicsT m = FreeT (Coyoneda GraphicsF) m
```

#### `Graphics`

``` purescript
type Graphics = GraphicsT Identity
```

#### `setLineWidth`

``` purescript
setLineWidth :: forall m. Number -> GraphicsT m Unit
```

#### `setFillStyle`

``` purescript
setFillStyle :: forall m. String -> GraphicsT m Unit
```

#### `setStrokeStyle`

``` purescript
setStrokeStyle :: forall m. String -> GraphicsT m Unit
```

#### `setShadowColor`

``` purescript
setShadowColor :: forall m. String -> GraphicsT m Unit
```

#### `setShadowBlur`

``` purescript
setShadowBlur :: forall m. Number -> GraphicsT m Unit
```

#### `setShadowOffsetX`

``` purescript
setShadowOffsetX :: forall m. Number -> GraphicsT m Unit
```

#### `setShadowOffsetY`

``` purescript
setShadowOffsetY :: forall m. Number -> GraphicsT m Unit
```

#### `setLineCap`

``` purescript
setLineCap :: forall m. LineCap -> GraphicsT m Unit
```

#### `setComposite`

``` purescript
setComposite :: forall m. Composite -> GraphicsT m Unit
```

#### `setAlpha`

``` purescript
setAlpha :: forall m. Number -> GraphicsT m Unit
```

#### `beginPath`

``` purescript
beginPath :: forall m. GraphicsT m Unit
```

#### `stroke`

``` purescript
stroke :: forall m. GraphicsT m Unit
```

#### `fill`

``` purescript
fill :: forall m. GraphicsT m Unit
```

#### `clip`

``` purescript
clip :: forall m. GraphicsT m Unit
```

#### `lineTo`

``` purescript
lineTo :: forall m. Number -> Number -> GraphicsT m Unit
```

#### `moveTo`

``` purescript
moveTo :: forall m. Number -> Number -> GraphicsT m Unit
```

#### `closePath`

``` purescript
closePath :: forall m. GraphicsT m Unit
```

#### `arc`

``` purescript
arc :: forall m. Arc -> GraphicsT m Unit
```

#### `rect`

``` purescript
rect :: forall m. Rectangle -> GraphicsT m Unit
```

#### `fillRect`

``` purescript
fillRect :: forall m. Rectangle -> GraphicsT m Unit
```

#### `strokeRect`

``` purescript
strokeRect :: forall m. Rectangle -> GraphicsT m Unit
```

#### `clearRect`

``` purescript
clearRect :: forall m. Rectangle -> GraphicsT m Unit
```

#### `scale`

``` purescript
scale :: forall m. Number -> Number -> GraphicsT m Unit
```

#### `rotate`

``` purescript
rotate :: forall m. Number -> GraphicsT m Unit
```

#### `translate`

``` purescript
translate :: forall m. Number -> Number -> GraphicsT m Unit
```

#### `transform`

``` purescript
transform :: forall m. Transform -> GraphicsT m Unit
```

#### `textAlign`

``` purescript
textAlign :: forall m. GraphicsT m TextAlign
```

#### `setTextAlign`

``` purescript
setTextAlign :: forall m. TextAlign -> GraphicsT m Unit
```

#### `font`

``` purescript
font :: forall m. GraphicsT m String
```

#### `setFont`

``` purescript
setFont :: forall m. String -> GraphicsT m Unit
```

#### `fillText`

``` purescript
fillText :: forall m. String -> Number -> Number -> GraphicsT m Unit
```

#### `strokeText`

``` purescript
strokeText :: forall m. String -> Number -> Number -> GraphicsT m Unit
```

#### `measureText`

``` purescript
measureText :: forall m. String -> GraphicsT m TextMetrics
```

#### `save`

``` purescript
save :: forall m. GraphicsT m Unit
```

#### `restore`

``` purescript
restore :: forall m. GraphicsT m Unit
```

#### `getImageData`

``` purescript
getImageData :: forall m. Number -> Number -> Number -> Number -> GraphicsT m ImageData
```

#### `putImageData`

``` purescript
putImageData :: forall m. ImageData -> Number -> Number -> GraphicsT m Unit
```

#### `putImageDataFull`

``` purescript
putImageDataFull :: forall m. ImageData -> Number -> Number -> Number -> Number -> Number -> Number -> GraphicsT m Unit
```

#### `createImageData`

``` purescript
createImageData :: forall m. Number -> Number -> GraphicsT m ImageData
```

#### `createImageDataCopy`

``` purescript
createImageDataCopy :: forall m. ImageData -> GraphicsT m ImageData
```

#### `drawImage`

``` purescript
drawImage :: forall m. CanvasImageSource -> Number -> Number -> GraphicsT m Unit
```

#### `runGraphics`

``` purescript
runGraphics :: forall a eff. Context2D -> Graphics a -> Eff (canvas :: CANVAS | eff) a
```

#### `runGraphicsT`

``` purescript
runGraphicsT :: forall a eff. Context2D -> GraphicsT (Eff (canvas :: CANVAS | eff)) a -> Eff (canvas :: CANVAS | eff) a
```


