module Graphics.Canvas.Free
  ( Graphics
  , GraphicsT
  , GraphicsF
  , arc
  , beginPath
  , clearRect
  , clip
  , closePath
  , createImageData
  , createImageDataCopy
  , drawImage
  , drawImageScale
  , drawImageFull
  , fill
  , fillRect
  , fillText
  , font
  , getImageData
  , lineTo
  , measureText
  , moveTo
  , putImageData
  , putImageDataFull
  , rect
  , restore
  , rotate
  , save
  , scale
  , setAlpha
  , setComposite
  , setFillStyle
  , setFont
  , setLineCap
  , setLineWidth
  , setShadowBlur
  , setShadowColor
  , setShadowOffsetX
  , setShadowOffsetY
  , setStrokeStyle
  , setTextAlign
  , stroke
  , strokeRect
  , strokeText
  , textAlign
  , transform
  , translate
  , runGraphics
  , runGraphicsT
  , interpretGraphics
  ) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Free.Trans (FreeT, liftFreeT, hoistFreeT, runFreeT)
import Data.Identity (Identity)
import Data.Newtype (unwrap)
import Graphics.Canvas as Canvas

data GraphicsF more
  = SetLineWidth Number more
  | SetFillStyle String more
  | SetStrokeStyle String more
  | SetShadowColor String more
  | SetShadowBlur Number more
  | SetShadowOffsetX Number more
  | SetShadowOffsetY Number more
  | SetLineCap Canvas.LineCap more
  | SetComposite Canvas.Composite more
  | SetAlpha Number more
  | BeginPath more
  | Stroke more
  | Fill more
  | Clip more
  | LineTo Number Number more
  | MoveTo Number Number more
  | ClosePath more
  | Arc Canvas.Arc more
  | Rect Canvas.Rectangle more
  | FillRect Canvas.Rectangle more
  | StrokeRect Canvas.Rectangle more
  | ClearRect Canvas.Rectangle more
  | Scale Number Number more
  | Rotate Number more
  | Translate Number Number more
  | Transform Canvas.Transform more
  | TextAlign (Canvas.TextAlign -> more)
  | SetTextAlign Canvas.TextAlign more
  | Font (String -> more)
  | SetFont String more
  | FillText String Number Number more
  | StrokeText String Number Number more
  | MeasureText String (Canvas.TextMetrics -> more)
  | Save more
  | Restore more
  | GetImageData Number Number Number Number (Canvas.ImageData -> more)
  | PutImageData Canvas.ImageData Number Number more
  | PutImageDataFull Canvas.ImageData Number Number Number Number Number Number more
  | CreateImageData Number Number (Canvas.ImageData -> more)
  | CreateImageDataCopy Canvas.ImageData (Canvas.ImageData -> more)
  | DrawImage Canvas.CanvasImageSource Number Number more
  | DrawImageScale Canvas.CanvasImageSource Number Number Number Number more
  | DrawImageFull Canvas.CanvasImageSource Number Number Number Number Number Number Number Number more

derive instance functorGraphicsF :: Functor GraphicsF

type GraphicsT = FreeT GraphicsF

type Graphics = GraphicsT Identity

liftGraphics :: forall m. Monad m => GraphicsF ~> GraphicsT m
liftGraphics = liftFreeT

setLineWidth :: forall m. Monad m => Number -> GraphicsT m Unit
setLineWidth w = liftGraphics $ SetLineWidth w unit

setFillStyle :: forall m. Monad m => String -> GraphicsT m Unit
setFillStyle s = liftGraphics $ SetFillStyle s unit

setStrokeStyle :: forall m. Monad m => String -> GraphicsT m Unit
setStrokeStyle s = liftGraphics $ SetStrokeStyle s unit

setShadowColor :: forall m. Monad m => String -> GraphicsT m Unit
setShadowColor c = liftGraphics $ SetShadowColor c unit

setShadowBlur :: forall m. Monad m => Number -> GraphicsT m Unit
setShadowBlur n = liftGraphics $ SetShadowBlur n unit

setShadowOffsetX :: forall m. Monad m => Number -> GraphicsT m Unit
setShadowOffsetX n = liftGraphics $ SetShadowOffsetX n unit

setShadowOffsetY :: forall m. Monad m => Number -> GraphicsT m Unit
setShadowOffsetY n = liftGraphics $ SetShadowOffsetY n unit

setLineCap :: forall m. Monad m => Canvas.LineCap -> GraphicsT m Unit
setLineCap lc = liftGraphics $ SetLineCap lc unit

setComposite :: forall m. Monad m => Canvas.Composite -> GraphicsT m Unit
setComposite c = liftGraphics $ SetComposite c unit

setAlpha :: forall m. Monad m => Number -> GraphicsT m Unit
setAlpha a = liftGraphics $ SetAlpha a unit

beginPath :: forall m. Monad m => GraphicsT m Unit
beginPath = liftGraphics $ BeginPath unit

stroke :: forall m. Monad m => GraphicsT m Unit
stroke = liftGraphics $ Stroke unit

fill :: forall m. Monad m => GraphicsT m Unit
fill = liftGraphics $ Fill unit

clip :: forall m. Monad m => GraphicsT m Unit
clip = liftGraphics $ Clip unit

lineTo :: forall m. Monad m => Number -> Number -> GraphicsT m Unit
lineTo x y = liftGraphics $ LineTo x y unit

moveTo :: forall m. Monad m => Number -> Number -> GraphicsT m Unit
moveTo x y = liftGraphics $ MoveTo x y unit

closePath :: forall m. Monad m => GraphicsT m Unit
closePath = liftGraphics $ ClosePath unit

arc :: forall m. Monad m => Canvas.Arc -> GraphicsT m Unit
arc a = liftGraphics $ Arc a unit

rect :: forall m. Monad m => Canvas.Rectangle -> GraphicsT m Unit
rect r = liftGraphics $ Rect r unit

fillRect :: forall m. Monad m => Canvas.Rectangle -> GraphicsT m Unit
fillRect r = liftGraphics $ FillRect r unit

strokeRect :: forall m. Monad m => Canvas.Rectangle -> GraphicsT m Unit
strokeRect r = liftGraphics $ StrokeRect r unit

clearRect :: forall m. Monad m => Canvas.Rectangle -> GraphicsT m Unit
clearRect r = liftGraphics $ ClearRect r unit

scale :: forall m. Monad m => Number -> Number -> GraphicsT m Unit
scale sx sy = liftGraphics $ Scale sx sy unit

rotate :: forall m. Monad m => Number -> GraphicsT m Unit
rotate th = liftGraphics $ Rotate th unit

translate :: forall m. Monad m => Number -> Number -> GraphicsT m Unit
translate tx ty = liftGraphics $ Translate tx ty unit

transform :: forall m. Monad m => Canvas.Transform -> GraphicsT m Unit
transform tx = liftGraphics $ Transform tx unit

textAlign :: forall m. Monad m => GraphicsT m Canvas.TextAlign
textAlign = liftGraphics $ TextAlign id

setTextAlign :: forall m. Monad m => Canvas.TextAlign -> GraphicsT m Unit
setTextAlign ta = liftGraphics $ SetTextAlign ta unit

font :: forall m. Monad m => GraphicsT m String
font = liftGraphics $ Font id

setFont :: forall m. Monad m => String -> GraphicsT m Unit
setFont f = liftGraphics $ SetFont f unit

fillText :: forall m. Monad m => String -> Number -> Number -> GraphicsT m Unit
fillText s x y = liftGraphics $ FillText s x y unit

strokeText :: forall m. Monad m => String -> Number -> Number -> GraphicsT m Unit
strokeText s x y = liftGraphics $ StrokeText s x y unit

measureText :: forall m. Monad m => String -> GraphicsT m Canvas.TextMetrics
measureText s = liftGraphics $ MeasureText s id

save :: forall m. Monad m => GraphicsT m Unit
save = liftGraphics $ Save unit

restore :: forall m. Monad m => GraphicsT m Unit
restore = liftGraphics $ Restore unit

getImageData :: forall m. Monad m => Number -> Number -> Number -> Number -> GraphicsT m Canvas.ImageData
getImageData x y w h = liftGraphics $ GetImageData x y w h id

putImageData :: forall m. Monad m => Canvas.ImageData -> Number -> Number -> GraphicsT m Unit
putImageData d x y = liftGraphics $ PutImageData d x y unit

putImageDataFull :: forall m. Monad m => Canvas.ImageData -> Number -> Number -> Number -> Number -> Number -> Number -> GraphicsT m Unit
putImageDataFull d x y dx dy dw dh = liftGraphics $ PutImageDataFull d x y dx dy dw dh unit

createImageData :: forall m. Monad m => Number -> Number -> GraphicsT m Canvas.ImageData
createImageData w h = liftGraphics $ CreateImageData w h id

createImageDataCopy :: forall m. Monad m => Canvas.ImageData -> GraphicsT m Canvas.ImageData
createImageDataCopy d = liftGraphics $ CreateImageDataCopy d id

drawImage :: forall m. Monad m => Canvas.CanvasImageSource -> Number -> Number -> GraphicsT m Unit
drawImage src x y = liftGraphics $ DrawImage src x y unit

drawImageScale :: forall m. Monad m => Canvas.CanvasImageSource -> Number -> Number -> Number -> Number -> GraphicsT m Unit
drawImageScale src x y w h = liftGraphics $ DrawImageScale src x y w h unit

drawImageFull :: forall m. Monad m => Canvas.CanvasImageSource -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> GraphicsT m Unit
drawImageFull src sx sy sw sh dx dy dw dh = liftGraphics $ DrawImageFull src sx sy sw sh dx dy dw dh unit

runGraphics
  :: forall eff
   . Canvas.Context2D
  -> Graphics
  ~> Eff (canvas :: Canvas.CANVAS | eff)
runGraphics ctx = runFreeT (interpretGraphics ctx) <<< hoistFreeT (pure <<< unwrap)

runGraphicsT
  :: forall eff
   . Canvas.Context2D
  -> GraphicsT (Eff (canvas :: Canvas.CANVAS | eff))
  ~> Eff (canvas :: Canvas.CANVAS | eff)
runGraphicsT ctx = runFreeT (interpretGraphics ctx)

interpretGraphics :: forall eff. Canvas.Context2D -> GraphicsF ~> Eff (canvas :: Canvas.CANVAS | eff)
interpretGraphics ctx = go where
  go (SetLineWidth w a) =
    const a <$> Canvas.setLineWidth w ctx
  go (SetFillStyle s a) =
    const a <$> Canvas.setFillStyle s ctx
  go (SetStrokeStyle s a) =
    const a <$> Canvas.setStrokeStyle s ctx
  go (SetShadowColor c a) =
    const a <$> Canvas.setShadowColor c ctx
  go (SetShadowBlur n a) =
    const a <$> Canvas.setShadowBlur n ctx
  go (SetShadowOffsetX n a) =
    const a <$> Canvas.setShadowOffsetX n ctx
  go (SetShadowOffsetY n a) =
    const a <$> Canvas.setShadowOffsetY n ctx
  go (SetLineCap lc a) =
    const a <$> Canvas.setLineCap lc ctx
  go (SetComposite c a) =
    const a <$> Canvas.setGlobalCompositeOperation ctx c
  go (SetAlpha s a) =
    const a <$> Canvas.setGlobalAlpha ctx s
  go (BeginPath a) =
    const a <$> Canvas.beginPath ctx
  go (Stroke a) =
    const a <$> Canvas.stroke ctx
  go (Fill a) =
    const a <$> Canvas.fill ctx
  go (Clip a) =
    const a <$> Canvas.clip ctx
  go (LineTo x y a) =
    const a <$> Canvas.lineTo ctx x y
  go (MoveTo x y a) =
    const a <$> Canvas.moveTo ctx x y
  go (ClosePath a) =
    const a <$> Canvas.closePath ctx
  go (Arc arc_ a) =
    const a <$> Canvas.arc ctx arc_
  go (Rect r a) =
    const a <$> Canvas.rect ctx r
  go (FillRect r a) =
    const a <$> Canvas.fillRect ctx r
  go (StrokeRect r a) =
    const a <$> Canvas.strokeRect ctx r
  go (ClearRect r a) =
    const a <$> Canvas.clearRect ctx r
  go (Scale sx sy a) =
    const a <$> Canvas.scale { scaleX: sx, scaleY: sy } ctx
  go (Rotate th a) =
    const a <$> Canvas.rotate th ctx
  go (Translate tx ty a) =
    const a <$> Canvas.translate { translateX: tx, translateY: ty } ctx
  go (Transform tx a) =
    const a <$> Canvas.transform tx ctx
  go (TextAlign k) =
    k <$> Canvas.textAlign ctx
  go (SetTextAlign ta a) =
    const a <$> Canvas.setTextAlign ctx ta
  go (Font k) =
    k <$> Canvas.font ctx
  go (SetFont f a) =
    const a <$> Canvas.setFont f ctx
  go (FillText s x y a) =
    const a <$> Canvas.fillText ctx s x y
  go (StrokeText s x y a) =
    const a <$> Canvas.strokeText ctx s x y
  go (MeasureText s k) =
    k <$> Canvas.measureText ctx s
  go (Save a) =
    const a <$> Canvas.save ctx
  go (Restore a) =
    const a <$> Canvas.restore ctx
  go (GetImageData x y w h k) =
    k <$> Canvas.getImageData ctx x y w h
  go (PutImageData d x y a) =
    const a <$> Canvas.putImageData ctx d x y
  go (PutImageDataFull d x y dx dy dw dh a) =
    const a <$> Canvas.putImageDataFull ctx d x y dx dy dw dh
  go (CreateImageData w h k) =
    k <$> Canvas.createImageData ctx w h
  go (CreateImageDataCopy d k) =
    k <$> Canvas.createImageDataCopy ctx d
  go (DrawImage src x y a) =
    const a <$> Canvas.drawImage ctx src x y
  go (DrawImageScale src x y w h a) =
    const a <$> Canvas.drawImageScale ctx src x y w h
  go (DrawImageFull src sx sy sw sh dx dy dw dh a) =
    const a <$> Canvas.drawImageFull ctx src sx sy sw sh dx dy dw dh
