NB. Recurrence relation z_n+1 = z_n ^ 2 + c
NB. rr =: [ + [: *: ]
rr =: +*: NB. this appears to work, and is much cleaner

NB. Apply recurrence relation up to 100 times or until mag >= 2
it =: rr ^: ([: 2&> [: | ]) ^: 100 & 0

NB. Mandelbrot, baby
require 'viewmat'
plane =: 0.5 -~ 180 %~ j./~i: 200
viewmat 2 > | (it"0) plane

exit 1
