## Module Graphics.Canvas.Free

#### `GraphicsF`

``` purescript
data GraphicsF more
```

#### `Graphics`

``` purescript
type Graphics a = FreeC GraphicsF a
```

#### `setLineWidth`

``` purescript
setLineWidth :: Number -> Graphics Unit
```

#### `setFillStyle`

``` purescript
setFillStyle :: String -> Graphics Unit
```

#### `setStrokeStyle`

``` purescript
setStrokeStyle :: String -> Graphics Unit
```

#### `setShadowColor`

``` purescript
setShadowColor :: String -> Graphics Unit
```

#### `setShadowBlur`

``` purescript
setShadowBlur :: Number -> Graphics Unit
```

#### `setShadowOffsetX`

``` purescript
setShadowOffsetX :: Number -> Graphics Unit
```

#### `setShadowOffsetY`

``` purescript
setShadowOffsetY :: Number -> Graphics Unit
```

#### `setLineCap`

``` purescript
setLineCap :: LineCap -> Graphics Unit
```

#### `setComposite`

``` purescript
setComposite :: Composite -> Graphics Unit
```

#### `setAlpha`

``` purescript
setAlpha :: Number -> Graphics Unit
```

#### `beginPath`

``` purescript
beginPath :: Graphics Unit
```

#### `stroke`

``` purescript
stroke :: Graphics Unit
```

#### `fill`

``` purescript
fill :: Graphics Unit
```

#### `clip`

``` purescript
clip :: Graphics Unit
```

#### `lineTo`

``` purescript
lineTo :: Number -> Number -> Graphics Unit
```

#### `moveTo`

``` purescript
moveTo :: Number -> Number -> Graphics Unit
```

#### `closePath`

``` purescript
closePath :: Graphics Unit
```

#### `arc`

``` purescript
arc :: Arc -> Graphics Unit
```

#### `rect`

``` purescript
rect :: Rectangle -> Graphics Unit
```

#### `fillRect`

``` purescript
fillRect :: Rectangle -> Graphics Unit
```

#### `strokeRect`

``` purescript
strokeRect :: Rectangle -> Graphics Unit
```

#### `clearRect`

``` purescript
clearRect :: Rectangle -> Graphics Unit
```

#### `scale`

``` purescript
scale :: Number -> Number -> Graphics Unit
```

#### `rotate`

``` purescript
rotate :: Number -> Graphics Unit
```

#### `translate`

``` purescript
translate :: Number -> Number -> Graphics Unit
```

#### `transform`

``` purescript
transform :: Transform -> Graphics Unit
```

#### `textAlign`

``` purescript
textAlign :: Graphics TextAlign
```

#### `setTextAlign`

``` purescript
setTextAlign :: TextAlign -> Graphics Unit
```

#### `font`

``` purescript
font :: Graphics String
```

#### `setFont`

``` purescript
setFont :: String -> Graphics Unit
```

#### `fillText`

``` purescript
fillText :: String -> Number -> Number -> Graphics Unit
```

#### `strokeText`

``` purescript
strokeText :: String -> Number -> Number -> Graphics Unit
```

#### `measureText`

``` purescript
measureText :: String -> Graphics TextMetrics
```

#### `save`

``` purescript
save :: Graphics Unit
```

#### `restore`

``` purescript
restore :: Graphics Unit
```

#### `getImageData`

``` purescript
getImageData :: Number -> Number -> Number -> Number -> Graphics ImageData
```

#### `putImageData`

``` purescript
putImageData :: ImageData -> Number -> Number -> Graphics Unit
```

#### `putImageDataFull`

``` purescript
putImageDataFull :: ImageData -> Number -> Number -> Number -> Number -> Number -> Number -> Graphics Unit
```

#### `createImageData`

``` purescript
createImageData :: Number -> Number -> Graphics ImageData
```

#### `createImageDataCopy`

``` purescript
createImageDataCopy :: ImageData -> Graphics ImageData
```

#### `runGraphics`

``` purescript
runGraphics :: forall a eff. Context2D -> Graphics a -> Eff (canvas :: Canvas | eff) a
```


