module Graphics.Canvas.Free 
  ( Graphics()
  , GraphicsF()

  , setLineWidth
  , setFillStyle
  , setStrokeStyle
  , setShadowColor
  , setShadowBlur
  , setShadowOffsetX
  , setShadowOffsetY
  , setLineCap
  , setComposite
  , setAlpha 

  , beginPath 
  , stroke
  , fill
  , clip
  , lineTo
  , moveTo
  , closePath

  , arc
  , rect

  , scale
  , rotate
  , translate
  , transform

  , setFont
  , fillText
  , strokeText
  , measureText

  , save
  , restore

  , getImageData
  , putImageData

  , runGraphics
  ) where

import Control.Monad.Eff
import Control.Monad.Free
import Data.Coyoneda

import qualified Graphics.Canvas as C

data GraphicsF more
  = SetLineWidth      Number      more
  | SetFillStyle      String      more
  | SetStrokeStyle    String      more
  | SetShadowColor    String      more
  | SetShadowBlur     Number      more
  | SetShadowOffsetX  Number      more
  | SetShadowOffsetY  Number      more
  | SetLineCap        C.LineCap   more
  | SetComposite      C.Composite more
  | SetAlpha          Number      more
  | BeginPath         more
  | Stroke            more
  | Fill              more
  | Clip              more
  | LineTo            Number      Number      more
  | MoveTo            Number      Number      more
  | ClosePath         more
  | Arc               C.Arc       more
  | Rect              C.Rectangle more
  | Scale             Number      Number      more
  | Rotate            Number      more
  | Translate         Number      Number      more
  | Transform         C.Transform more
  | SetFont           String      more
  | FillText          String      Number      Number    more
  | StrokeText        String      Number      Number    more
  | MeasureText       String      (C.TextMetrics -> more)
  | Save              more
  | Restore           more
  | GetImageData      Number      Number      Number    Number   (C.ImageData -> more)
  | PutImageData      C.ImageData Number      Number    more

type Graphics a = FreeC GraphicsF a

setLineWidth :: Number -> Graphics Unit
setLineWidth w = liftFC $ SetLineWidth w unit

setFillStyle :: String -> Graphics Unit
setFillStyle s = liftFC $ SetFillStyle s unit

setStrokeStyle :: String -> Graphics Unit
setStrokeStyle s = liftFC $ SetStrokeStyle s unit

setShadowColor :: String -> Graphics Unit
setShadowColor c = liftFC $ SetShadowColor c unit

setShadowBlur :: Number -> Graphics Unit
setShadowBlur n = liftFC $ SetShadowBlur n unit

setShadowOffsetX :: Number -> Graphics Unit
setShadowOffsetX n = liftFC $ SetShadowOffsetX n unit

setShadowOffsetY :: Number -> Graphics Unit
setShadowOffsetY n = liftFC $ SetShadowOffsetY n unit

setLineCap :: C.LineCap -> Graphics Unit
setLineCap lc = liftFC $ SetLineCap lc unit

setComposite :: C.Composite -> Graphics Unit
setComposite c = liftFC $ SetComposite c unit

setAlpha :: Number -> Graphics Unit
setAlpha a = liftFC $ SetAlpha a unit

beginPath :: Graphics Unit
beginPath = liftFC $ BeginPath unit

stroke :: Graphics Unit
stroke = liftFC $ Stroke unit

fill :: Graphics Unit
fill = liftFC $ Fill unit

clip :: Graphics Unit
clip = liftFC $ Clip unit

lineTo :: Number -> Number -> Graphics Unit
lineTo x y = liftFC $ LineTo x y unit

moveTo :: Number -> Number -> Graphics Unit
moveTo x y = liftFC $ MoveTo x y unit

closePath :: Graphics Unit
closePath = liftFC $ ClosePath unit

arc :: C.Arc -> Graphics Unit
arc a = liftFC $ Arc a unit

rect :: C.Rectangle -> Graphics Unit
rect r = liftFC $ Rect r unit

scale :: Number -> Number -> Graphics Unit
scale sx sy = liftFC $ Scale sx sy unit

rotate :: Number -> Graphics Unit
rotate th = liftFC $ Rotate th unit

translate :: Number -> Number -> Graphics Unit
translate tx ty = liftFC $ Translate tx ty unit

transform :: C.Transform -> Graphics Unit
transform tx = liftFC $ Transform tx unit

setFont :: String -> Graphics Unit
setFont f = liftFC $ SetFont f unit

fillText :: String -> Number -> Number -> Graphics Unit
fillText s x y = liftFC $ FillText s x y unit

strokeText :: String -> Number -> Number -> Graphics Unit
strokeText s x y = liftFC $ StrokeText s x y unit

measureText :: String -> Graphics C.TextMetrics 
measureText s = liftFC $ MeasureText s id

save :: Graphics Unit
save = liftFC $ Save unit

restore :: Graphics Unit
restore = liftFC $ Restore unit

getImageData :: Number -> Number -> Number -> Number -> Graphics C.ImageData
getImageData x y w h = liftFC $ GetImageData x y w h id

putImageData :: C.ImageData -> Number -> Number -> Graphics Unit
putImageData d x y = liftFC $ PutImageData d x y unit 

runGraphics :: forall a eff. C.Context2D -> Graphics a -> Eff (canvas :: C.Canvas | eff) a
runGraphics ctx = goEffC interp
  where
  interp :: forall eff. Natural GraphicsF (Eff (canvas :: C.Canvas | eff))
  interp (SetLineWidth w a) = const a <$> C.setLineWidth w ctx
  interp (SetFillStyle s a) = const a <$> C.setFillStyle s ctx
  interp (SetStrokeStyle s a) = const a <$> C.setStrokeStyle s ctx 
  interp (SetShadowColor c a) = const a <$> C.setShadowColor c ctx
  interp (SetShadowBlur n a) = const a <$> C.setShadowBlur n ctx
  interp (SetShadowOffsetX n a) = const a <$> C.setShadowOffsetX n ctx
  interp (SetShadowOffsetY n a) = const a <$> C.setShadowOffsetY n ctx
  interp (SetLineCap lc a) = const a <$> C.setLineCap lc ctx
  interp (SetComposite c a) = const a <$> C.setGlobalCompositeOperation ctx c
  interp (SetAlpha s a) = const a <$> C.setGlobalAlpha ctx s
  interp (BeginPath a) = const a <$> C.beginPath ctx
  interp (Stroke a) = const a <$> C.stroke ctx
  interp (Fill a) = const a <$> C.fill ctx
  interp (Clip a) = const a <$> C.clip ctx
  interp (LineTo x y a) = const a <$> C.lineTo ctx x y
  interp (MoveTo x y a) = const a <$> C.moveTo ctx x y
  interp (ClosePath a) = const a <$> C.closePath ctx
  interp (Arc arc a) = const a <$> C.arc ctx arc
  interp (Rect r a) = const a <$> C.rect ctx r
  interp (Scale sx sy a) = const a <$> C.scale { scaleX: sx, scaleY: sy } ctx
  interp (Rotate th a) = const a <$> C.rotate th ctx
  interp (Translate tx ty a) = const a <$> C.translate { translateX: tx, translateY: ty } ctx
  interp (Transform tx a) = const a <$> C.transform tx ctx
  interp (SetFont f a) = const a <$> C.setFont f ctx
  interp (FillText s x y a) = const a <$> C.fillText ctx s x y
  interp (StrokeText s x y a) = const a <$> C.strokeText ctx s x y
  interp (MeasureText s k) = k <$> C.measureText ctx s
  interp (Save a) = const a <$> C.save ctx
  interp (Restore a) = const a <$> C.restore ctx
  interp (GetImageData x y w h k) = k <$> C.getImageData ctx x y w h
  interp (PutImageData d x y a) = const a <$> C.putImageData ctx d x y

