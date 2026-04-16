mandelbrot =: +*:
bbiter =: 2 : '~. y (u ^: v ^: (i. 100)) 0' NB. iterate until escape and save visited Z's

NB. generate y pairs of random numbers in [0,1)
randpairs =: [: ? 0 $~ ,&2

NB. convert 2 numbers in [0,1) to coord pair inside unit circle
circrand =: (%:@{. * (2 1 o. 2p1&*)@{:)"1

NB. 'point'plot ;/ |: circrand randpairs 1000

NB. j./"(1) 2 * circrand randpairs 10

NB. fun plot of non-escapees, very 90s
NB. plot , > (#~ [: , [: (=&100) [: > $ each) ([: < mandelbrot bbiter pr)"(0) j./"(1) 2 * circrand randpairs 100

NB. raw points of buddhabrot
NB. 'point' plot >,each/ (#~ 100 > [: , [: > $ each) ([: < mandelbrot bbiter pr)"(0) j./"(1) 2 * circrand randpairs 10000
