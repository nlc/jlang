NB. Off-axis field in the interior of a ring with constant (charge/mass) density
NB. F(p) = intensity at distance p from center of ring of radius r

require 'physicshelpers.ijs'

dFa =: 1 : 'c * % %: (*: m) + (*: y) - 2 * m * y * c =. cos x'


R =: 1

dF =: R dFa


NB. https://code.jsoftware.com/wiki/JPhrases/SimpsonIntegraton
NB. would stand a refactor, I don't like the way it's written
Simpson=: 1 : 0
  'lower upper int'=. 3{.y,128
  size=. int%~upper-lower
  val=. u lower+size*i.>:int
  size*+/val*3%~1,1,~4 2$~<:int
)

require 'plot'
plot dF&(0.01 * 1 + i. 99)"0 Simpson 0 2p1 1000
