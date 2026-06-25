NB. create complex matrix representing a quaternion given as <a b c d>
mkqmat =: 3 : 0
  'a b c d' =. y

  2 2 $ (a , c, (-c), a) j. (b , d, d, -b)
)

toabcd =: (3 : 0)"2
  'r s' =. 2 {. , y
  'a b' =. +. r
  'c d' =. +. s

  a , b , c, d
)
