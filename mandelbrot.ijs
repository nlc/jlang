NB. Recurrence relation z_n+1 = z_n ^ 2 + c
rr =: [ + [: *: ]

NB. Apply recurrence relation up to 100 times or until mag >= 2
it =: rr ^: ([: 2&> [: | ]) ^: 100 & 0

NB. Mandelbrot, bitch
plane =: 0.5 -~ 18 %~ j./~i: 20
2 > | (it"0) plane
