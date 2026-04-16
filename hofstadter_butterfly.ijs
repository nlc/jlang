d =: -/ . * NB. determinant
i =: [: =/~ i. NB. identity matrix
c =: 2 | [: +/~ i. NB. "Checkerboard" of off-diagonal 1s

V =: 2 * 2 o. 2p1 * * NB. Diagonal entries V(k) = 2 cos(2 pi k y); y V k

L =: (3 : 0)"0 M.
  'p q' =: 2 x: y

  (c q) + (y V 1 + i. q) * i q
)

f =: (4 : 0)"0
  'p q' =: 2 x: y

  q %~ ^. | d (L y) - x
)

NB. Not generating a matching plot for some reason...
