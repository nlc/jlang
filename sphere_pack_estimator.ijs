pack =: 2 : 0
  'N R E' =: 3 {. y , 0.5
  v^:(_1) E %~ N * u R
)

sphere2d =: 4p1 * ^&2
sphere3d =: 4r3p1 * ^&3
cube2d =: 6 * ^&2
cube3d =: ^&3
circle1d =: 2p1&*
circle2d =: 1p1 * ^&2
