lfmat =: 2 2 $ 0 _1 1 0
rtmat =: %. lfmat

rotations =: rtmat ,: lfmat

ant =: 3 : 0
  'grid loc vel' =. y

  cell =. (< loc) { grid

  newvel =. (cell { rotations) +/ . * vel NB. turn
  newgrid =. (-. cell) (< loc) } grid NB. flip
  newloc =. loc + newvel NB. walk

  newgrid ; newloc ; newvel
)

velidx =: ([: -: _1 +  3 3 #. 1 + ])"1
Note 'direction indices'
    ^
    0
< 1   2 >
    3
    v
)
prettify =: 3 : 0
  'grid loc vel' =. y

  cell =. (< loc) { grid

  ch =. 'ulrdULRD' {~ (4 * cell) + velidx vel

  ch (< loc) } grid { '.O'
)

gridsize =: 2 # 79
state =: (gridsize $ 0) ; (>. gridsize % 2) ; (0 _1)
NB. prettify ant^:(11000) state
