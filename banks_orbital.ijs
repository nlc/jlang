require 'format/printf'

Note 'Calculations'
  Omega = 2 pi / T
  R = a / Omega^2
  => R = a T^2 / 4 pi^2
)

orbital =: 3 : 0
  if. 2 > # y do.
    return. a:
  end.

  'gravity day' =. 2 {. y

  omega =. 2p1 % day
  radius =. gravity % *: omega
  velocity =. omega * radius

  rvo =. radius ; velocity ; omega

  if. 3 > # y do.
    rvo
  else.
    width =. 2 { y
    area =. width * 2p1 * radius
    rvo , < area
  end.
)

NB. Pretty-print orbital info
pporbital =: 3 : 0
  res =. orbital y

  if. 3 = # res do.
    'radius velocity omega' =. res
    radiuskm =. 1000 %~ radius
    velocitykms =. 1000 %~ velocity
    omegarads =. omega
    'ORBITAL: %d km radius | %0.1f km/s tangential | %0.7f rad/s angular' sprintf radiuskm ; velocitykms ; omegarads
  elseif. 4 = # res do.
    'radius velocity omega area' =. res
    radiuskm =. 1000 %~ radius
    velocitykms =. 1000 %~ velocity
    omegarads =. omega
    areakm2 =. 1000000 %~ area
    areaearths =. areakm2 % 510072000
    'ORBITAL: %.2e km radius | %.2e km/s tangential (%.2e rad/s) | %.4e km2 area (%.1f Earths)' sprintf radiuskm ; velocitykms ; omegarads ; areakm2 ; areaearths
  else.
    'Malformed input!'
  end.
)

g =: 9.80665
day =: 86164.0905
echo g , day
echo pporbital g , day
echo pporbital g , day , 3000000

NB. exit 1
