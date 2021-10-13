NB. Recurrence relation z_n+1 = z_n ^ 2 + c
NB. rr =: [ + [: *: ]
mandelbrot =: +*: NB. this appears to work, and is much cleaner

NB. Apply recurrence relation up to 100 times while pred = true
mkiter =: 2 : 'y (u ^: v ^: 100) 0'

NB. Apply recurrence relation up to 100 times or until mag >= 2
NB. it =: rr ^: ([: 2&> [: | ]) ^: 100 & 0
rr =: mandelbrot NB. recurrence relation: square x and add y
pr =: 2>|@] NB. predicate: while 2 > magnitude
it =: rr mkiter pr

NB. NB. Mandelbrot, baby
NB. require 'viewmat'
NB. plane =: 0.5 -~ 180 %~ j./~i: 200
NB. viewmat pr (it"0) plane
NB. 
NB. exit 1

3 : '(2>|@]) ((+y^~]) mkiter (2>|@]))"0 plane'
