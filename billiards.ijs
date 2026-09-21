require 'plot'

atan2 =: (12 o. [: j./ ])"1

mkrotmat =: 2 2 $ 1 _1 1 1 * 2 1 1 2&o.
rot =: (mkrotmat@[ +/ . * ])"0 1
ngon =: (1 0 rot~ (2p1*]%~i.))

closepath =: ],{.
plotpath =: [: plot j./"1

NB. Leftmost point in list x from the perspective of point y looking toward origin
NB. FIXME: Appears to cross the polygon at times. Unsure when or why.
nextcorner =: [: , [ #~ [: (] = [: >./ ] #~ 1r2p1 >: 2p1&|) ([atan2 -~)"1-atan2@]
billiard =: ] -~ 2 * nextcorner

NB. plotpath (ngon 5) billiard^:(i. 100) 10 3
