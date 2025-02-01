sin =: 1&o.
cos =: 2&o.
atan2 =: (12 o. [: j./ ])"1

NB. Cartesian 2 Spherical
NB. <r, theta, phi> as in ISO_31-11
c2s =: 3 : 0
  'rx ry rz' =. y

  phi2 =. rx +&*: ry

  radius =. %: phi2 + *: rz
  polar =. atan2 rz , %: phi2
  azimuthal =. atan2 rx , ry

  radius , polar, azimuthal
)

NB. White and Nylander's formula for the "nth power" of a 3D vector
pow3d =: 4 : 0
  'radius polar azimuthal' =. c2s x
  power =. y

  nt =. power * polar
  np =. power * azimuthal
  snt =. sin nt

  (radius ^ power) * (snt * cos np) , (snt * sin np) , (cos nt)
)

mandelbulb8 =: (+pow3d&8)"1

NB. Radius Less Than
rlt =: (([: +/ *:)@[ < *:@])"1

NB. Apply recurrence relation up to some number of times while pred = true
mkiter =: 2 : 'y (u ^: v ^: 30) 0 0 0'

rr =: mandelbulb8 NB. recurrence relation: take the 8th "3D power"
pr =: rlt&2 NB. predicate: while radius < 2
it =: rr mkiter pr

require 'viewmat'
require 'format/printf'
Note 'usage'
  plane =: ,&0.7"(1) 1r50 * ,"0/~ i: 50 NB. sample slice at z=0.7
  pr (mandelbulb8 ^: pr ^: 10)"1 plane
)

mandelslice =: 3 : 0
  pr (mandelbulb8 ^: pr ^: 10)"1 ,&y"(1) 115 %~ ,"0/~ i: 150
)

writemandelslice =: 4 : 0
  imgidx =. x
  zcoord =. y
  fname =. '.pbm' ,~ 'mandelbulb_' , ('\.' ; '_') rxrplc '%03d' sprintf x
  result =. mandelslice zcoord
  dims =. ": $ result
  fname fwrite~ 'P1' , dims , ": result
)

(i. # zcoords) writemandelslice"(0) zcoords =: 115 %~ i: 151
NB. convert mandelbulb_*.pbm mandelbulb_final.gif

NB. for pingpong
NB. convert mandelbulb_final.gif -coalesce -duplicate 1,-2-1 -quiet -layers OptimizePlus mandelbulb_pingpong.gif
