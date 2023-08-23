require 'format/printf'

NB. seed RNG with time
seed =: 3 : '(9!:1) RNGSEED =: ". (6!:0) ''mmsssss'''

winlocs =: (i. 3 3) e."(2 1) 8 3 $ 0 1 2 3 4 5 6 7 8 0 3 6 1 4 7 2 5 8 0 4 8 2 4 6
winscan =: winlocs #&,"2 ]

boardpattern =: (39 $ '%c|%c|%c' , LF , '-+-+-' , LF)

game =: 3 3 $ 'O X OXXOX'

analyze =: 3 : 0
  board =. y

  winstate =. #. (2 3 $ 'XXXOOO') e."1 2 winscan board
  valid =. winstate < 3 NB. X and O can't both be winners
  iswin =. winstate e. 1 2
  winner =. winstate { 'NOXB'

  xoccupancy =. 'X' = , board
  ooccupancy =. 'O' = , board
  valid =. (+/ xoccupancy) e. (+/ ooccupancy) + 0 1 NB. #X at most one more than #O

  occupancy =. xoccupancy OR ooccupancy
  playing =. (9 > +/ occupancy) AND (-. iswin) AND (valid)
  free =. I. -. occupancy
  ply =. +/ occupancy
  toplay =. 'XO' {~ 2 | ply

  valid ; playing ; iswin ; ply ; toplay ; winner ; free
)

unwrapping =: , :. (3 3 $ ])

move =: 4 : 0
  squareidx =. x
  board =. y
  'valid playing iswin ply toplay winner free' =. analyze board

  if. (squareidx e. free) AND (playing) AND (valid) do.
    (toplay (squareidx) } ])&.unwrapping board
  else.
    board
  end.
)

deal1 =: {~1?#
Note 'random play'
  g2 =: 3 3 $ '  X XOO  '
  (deal1 6 pick analyze g2) move g2
)

playrand =: 3 : 0
  g =. y

  while. 1 pick analyze g do.
    boardpattern printf , g =. (deal1 6 pick analyze g) move g
    echo ''
  end.

  'valid playing iswin ply toplay winner free' =. analyze g
  if. iswin do.
    echo winner , ' WINS'
  else.
    echo 'DRAW'
  end.
)

playrand 3 3 $ ' '
