NB. Constants
G =: 6.67428E_11 NB. m3 kg-1 s-2
Msun =: 1.9885E30 NB. kg
Mearth =: 5.97237E24 NB. kg

NB. Rotation Matrices
rotateX =: dyad define
  's c' =. 1 2 o. x

  R =. 3 3 $ 1 0 0 0 , c , (-s) , 0 , s , c

  R +/ . * y
)

rotateY =: dyad define NB. included for completenes
  's c' =. 1 2 o. x

  R =. 3 3 $ c , 0 , s , 0 1 0 , (-s) , 0 , c

  R +/ . * y
)

rotateZ =: dyad define
  's c' =. 1 2 o. x

  R =. 3 3 $ c , (-s) , 0 , s , c , 0 0 0 1

  R +/ . * y
)

NB. Other helper functions
atan2 =: 12 o. j.
sgp =: G&* NB. Standard Gravitational Paramter mu=G*M
toradians =: 1r180p1&*

iterkepler =: dyad define
  'ma e' =. x
  Ej =. y

  Ej - (Ej - (e * 1&o. Ej) - ma) % 1 - e * 2&o. Ej
)

solvekepler =: monad define
  'ma e' =. y

  E0 =. ma

  NB. for params 1,1 it actually converges to <1E_5 after only 5 iterations
  (ma , e) (iterkepler^:20) E0 NB. can safely boost this above 20 if needed
)

tospherical =: monad define NB. cartesian to spherical
  'rx ry rz' =. y
  azimuth =. rx atan2 ry
  radius =. +/&.:%: y
  xyradius =. +/&.:%: rx , ry
  inclination =. _3&o. rz % xyradius

  radius , azimuth , inclination
)

NB. Convert keplerian orbital elements to cartesian coords/time derivatives
keplerian2cartesian =: dyad define
  NB. mp: mass of the primary
  mp =. x

  NB. e:   eccentricity [1]
  NB. a:   semi-major axis [m]
  NB. i:   inclination [rad]
  NB. lan: longitude of ascending node [rad]
  NB. ap:  argument of periapsis [rad]
  NB. ma0: mean anomaly at t0 [rad]
  NB. dt:  time since epoch [s]
  'e a i lan ap ma0 dt' =. y
  NB. echo 'eccentricity' ; e
  NB. echo 'semimajor axis' ; a
  NB. echo 'inclination' ; i
  NB. echo 'long. of asc. node' ; lan
  NB. echo 'arg. of periapsis' ; ap
  NB. echo 'mean anom. @ t0' ; ap
  NB. echo 'time since epoch' ; dt

  NB. Step 1: Calculate Mean Anomaly (ma)
  mu =. sgp mp
  ma =. 2p1 | ma0 + dt * %: mu % a ^ 3
  NB. echo 'mean anomaly' ; ma

  NB. Step 2: Solve Kepler's equation M(t) = E(t) - e sin(E(t)) for
  NB.         the eccentric anomaly E (ea) using Newton's method
  ea =. solvekepler ma , e
  NB. echo 'eccentric anomaly' ; ea

  NB. Step 3: Obtain the True Anomaly (ta)
  NB. 'p1 p2' =. -: ea * %: >: e , -e
  p1 =. -: ea * %: 1&+ e
  p2 =. -: ea * %: 1&- e
  ta =. +: p1 atan2 p2
  NB. echo 'true anomaly' ; ta

  NB. Step 4: Use the eccentric anomaly to get the distance to the primary (rc)
  rc =. a * 1&- e * 2&o. ea
  NB. echo 'dist. to primary' ; rc

  NB. Step 5: Obtan the orbital-frame position and velocity vectors (ro, vo)
  'sta cta' =. 1 2 o. ta
  ro =. rc * cta , sta , 0
  'sea cea' =. 1 2 o. ea
  vo =. (rc %~ %: mu * a) * (-sea) , (cea * 0&o. e) , 0
  NB. echo 'mult. for vo' ; rc %~ %: mu * a
  NB. surprise cop() function ---------------^
  NB. echo 'position (orb. frame)' ; ro
  NB. echo 'velocity (orb. frame)' ; vo

  NB. Step 6: Transform ro and vo to the inertial frame in bodycentric
  NB.         rectangular coordinates (rb, vb)

  rb =. (-lan) rotateZ (-i) rotateX (-ap) rotateZ ro
  vb =. (-lan) rotateZ (-i) rotateX (-ap) rotateZ vo
  NB. echo 'position (bodycentric)' ; ro
  NB. echo 'velocity (bodycentric)' ; vo

  rb , vb
)

NB. Some test data:
NB. At 1618090330 Unix epoch, the following satellite was approximately
NB. over the center of the US. The following data is from its most recent TLE:
NB. LEMUR-2-WINGO
NB. 1 41874U 16062F   21100.21973126  .00001650  00000-0  72718-4 0  9995
NB. 2 41874  51.6522 285.2956 0011936 111.0163 249.2095 15.27809529243487
NB. i.e.
NB. 100.21973126 days year 21 \
NB.   (05:16:24.7809, April 10, 2021 mean solar) (1618031784.7809)
NB. 51.6522 degrees inclination
NB. 285.2956 degrees right ascension of ascending node
NB. 0.0011936 eccentricity
NB. 111.0163 degrees argument of perigee
NB. 249.2095 degrees mean anomaly
NB. 15.27809529 rev/day mean motion
NB. 24348 revolutions at epoch
NB. Times are measured in mean solar time

e =: 0.0011936
meanmotion =: 15.27809529 % 86400
a =: 1r3 ^~ (sgp Mearth) % *: o. +: meanmotion
i =: toradians 51.6522
lan =: toradians 285.2956
ap =: toradians 111.0163
ma =: 249.2095
dt =: 1618090330 - 1618031784

echo Mearth keplerian2cartesian e , a , i , lan , ap,  ma , dt
