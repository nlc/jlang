require 'format/printf'

Note 'Math'
  O: Origin, planet center
  P: Point on planet surface at which sunlight is tangent to the ground.
  A: Point at apex of tower

  r: planet radius
  h: tower height
  theta: angle between line segments OA and OP
  omega: planet rotation rate in rad/s
  t: theta / omega

  theta = acos(r / (r + h))
)

acos =: _2&o.

find_theta =: [: acos [ % + NB. r, h
find_omega =: 2p1 % ] NB. T
find_t =: %~ NB. omega, theta

r =: 6.3781e6 NB. Earth Radius; meters
T =: 86400 NB. planetary rotation period; seconds
h =: 52e3 NB. Height of the Seat of Judgment tower; meters

omega =: find_omega T
theta =: r find_theta h
t =: omega find_t theta

t_minutes =: t % 60
t_hours =: t_minutes % 60
'%0.2f seconds / %0.2f minutes / %0.2f hours' printf t ; t_minutes ; t_hours
