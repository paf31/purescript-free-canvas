## Module Graphics.Canvas.Free

#### `GraphicsF`

``` purescript
data GraphicsF more
```

##### Instances
``` purescript
Functor GraphicsF
```

#### `GraphicsT`

``` purescript
type GraphicsT = FreeT GraphicsF
```

#### `Graphics`

``` purescript
type Graphics = GraphicsT Identity
```

#### `setLineWidth`

``` purescript
setLineWidth :: forall m. Monad m => Number -> GraphicsT m Unit
```

#### `setFillStyle`

``` purescript
setFillStyle :: forall m. Monad m => String -> GraphicsT m Unit
```

#### `setStrokeStyle`

``` purescript
setStrokeStyle :: forall m. Monad m => String -> GraphicsT m Unit
```

#### `setShadowColor`

``` purescript
setShadowColor :: forall m. Monad m => String -> GraphicsT m Unit
```

#### `setShadowBlur`

``` purescript
setShadowBlur :: forall m. Monad m => Number -> GraphicsT m Unit
```

#### `setShadowOffsetX`

``` purescript
setShadowOffsetX :: forall m. Monad m => Number -> GraphicsT m Unit
```

#### `setShadowOffsetY`

``` purescript
setShadowOffsetY :: forall m. Monad m => Number -> GraphicsT m Unit
```

#### `setLineCap`

``` purescript
setLineCap :: forall m. Monad m => LineCap -> GraphicsT m Unit
```

#### `setComposite`

``` purescript
setComposite :: forall m. Monad m => Composite -> GraphicsT m Unit
```

#### `setAlpha`

``` purescript
setAlpha :: forall m. Monad m => Number -> GraphicsT m Unit
```

#### `beginPath`

``` purescript
beginPath :: forall m. Monad m => GraphicsT m Unit
```

#### `stroke`

``` purescript
stroke :: forall m. Monad m => GraphicsT m Unit
```

#### `fill`

``` purescript
fill :: forall m. Monad m => GraphicsT m Unit
```

#### `clip`

``` purescript
clip :: forall m. Monad m => GraphicsT m Unit
```

#### `lineTo`

``` purescript
lineTo :: forall m. Monad m => Number -> Number -> GraphicsT m Unit
```

#### `moveTo`

``` purescript
moveTo :: forall m. Monad m => Number -> Number -> GraphicsT m Unit
```

#### `closePath`

``` purescript
closePath :: forall m. Monad m => GraphicsT m Unit
```

#### `arc`

``` purescript
arc :: forall m. Monad m => Arc -> GraphicsT m Unit
```

#### `rect`

``` purescript
rect :: forall m. Monad m => Rectangle -> GraphicsT m Unit
```

#### `fillRect`

``` purescript
fillRect :: forall m. Monad m => Rectangle -> GraphicsT m Unit
```

#### `strokeRect`

``` purescript
strokeRect :: forall m. Monad m => Rectangle -> GraphicsT m Unit
```

#### `clearRect`

``` purescript
clearRect :: forall m. Monad m => Rectangle -> GraphicsT m Unit
```

#### `scale`

``` purescript
scale :: forall m. Monad m => Number -> Number -> GraphicsT m Unit
```

#### `rotate`

``` purescript
rotate :: forall m. Monad m => Number -> GraphicsT m Unit
```

#### `translate`

``` purescript
translate :: forall m. Monad m => Number -> Number -> GraphicsT m Unit
```

#### `transform`

``` purescript
transform :: forall m. Monad m => Transform -> GraphicsT m Unit
```

#### `textAlign`

``` purescript
textAlign :: forall m. Monad m => GraphicsT m TextAlign
```

#### `setTextAlign`

``` purescript
setTextAlign :: forall m. Monad m => TextAlign -> GraphicsT m Unit
```

#### `font`

``` purescript
font :: forall m. Monad m => GraphicsT m String
```

#### `setFont`

``` purescript
setFont :: forall m. Monad m => String -> GraphicsT m Unit
```

#### `fillText`

``` purescript
fillText :: forall m. Monad m => String -> Number -> Number -> GraphicsT m Unit
```

#### `strokeText`

``` purescript
strokeText :: forall m. Monad m => String -> Number -> Number -> GraphicsT m Unit
```

#### `measureText`

``` purescript
measureText :: forall m. Monad m => String -> GraphicsT m TextMetrics
```

#### `save`

``` purescript
save :: forall m. Monad m => GraphicsT m Unit
```

#### `restore`

``` purescript
restore :: forall m. Monad m => GraphicsT m Unit
```

#### `getImageData`

``` purescript
getImageData :: forall m. Monad m => Number -> Number -> Number -> Number -> GraphicsT m ImageData
```

#### `putImageData`

``` purescript
putImageData :: forall m. Monad m => ImageData -> Number -> Number -> GraphicsT m Unit
```

#### `putImageDataFull`

``` purescript
putImageDataFull :: forall m. Monad m => ImageData -> Number -> Number -> Number -> Number -> Number -> Number -> GraphicsT m Unit
```

#### `createImageData`

``` purescript
createImageData :: forall m. Monad m => Number -> Number -> GraphicsT m ImageData
```

#### `createImageDataCopy`

``` purescript
createImageDataCopy :: forall m. Monad m => ImageData -> GraphicsT m ImageData
```

#### `drawImage`

``` purescript
drawImage :: forall m. Monad m => CanvasImageSource -> Number -> Number -> GraphicsT m Unit
```

#### `drawImageScale`

``` purescript
drawImageScale :: forall m. Monad m => CanvasImageSource -> Number -> Number -> Number -> Number -> GraphicsT m Unit
```

#### `drawImageFull`

``` purescript
drawImageFull :: forall m. Monad m => CanvasImageSource -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> GraphicsT m Unit
```

#### `runGraphics`

``` purescript
runGraphics :: forall eff. Context2D -> Graphics ~> (Eff (canvas :: CANVAS | eff))
```

#### `runGraphicsT`

``` purescript
runGraphicsT :: forall eff. Context2D -> (GraphicsT (Eff (canvas :: CANVAS | eff))) ~> (Eff (canvas :: CANVAS | eff))
```

#### `interpretGraphics`

``` purescript
interpretGraphics :: forall eff. Context2D -> GraphicsF ~> (Eff (canvas :: CANVAS | eff))
```


