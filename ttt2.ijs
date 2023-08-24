require 'format/printf'

NB. seed RNG with time
seed =: 3 : '(9!:1) RNGSEED =: ". (6!:0) ''mmsssss'''

winlocs =: (i. 3 3) e."(2 1) 8 3 $ 0 1 2 3 4 5 6 7 8 0 3 6 1 4 7 2 5 8 0 4 8 2 4 6
winscan =: winlocs #&,"2 ]

boardpattern =: (39 $ '%c|%c|%c' , LF , '-+-+-' , LF)
displayboard =: (boardpattern printf ,)"2

encodefwd =: ((9#3) #. ' XO' i. ,)"2
decodefwd =: (3 3 $ ' XO' {~ (9#3) #: ])"0
encode =: encodefwd :. decodefwd
decode =: decodefwd :. encodefwd

equivalents =: [: (,"3 |."2) [: (,"3 |:"2) (,: |.)
canenc =: [: <./ [: encode equivalents NB. "canonical" encoding is the lowest number of 8 possible encodings
candec =: [: ~. [: equivalents decode NB. Show all possible decodes of a "canonical" encoding

game =: 3 3 $ 'O X OXXOX'

analyze =: 3 : 0
  board =. y

  winstate =. #. (2 3 $ 'XXXOOO') e."1 2 winscan board
  valid =. winstate < 3 NB. X and O can't both be winners
  iswin =. winstate e. 1 2
  winner =. winstate { 'NOXB'

  xoccupancy =. 'X' = , board
  ooccupancy =. 'O' = , board
  valid =. ((+/ xoccupancy) e. (+/ ooccupancy) + 0 1) AND (valid) NB. #X at most one more than #O

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
  board =. y
  if. -. 3 3 -: $ board do.
    board =. 3 3 $ ' '
  end.

  moves =. 0 $ 0

  'valid playing iswin ply toplay winner free' =. analyze board
  while. playing do.
    movechoice =: deal1 free
    board =. movechoice move board

    moves =. moves , movechoice

    NB. displayboard board
    NB. echo ''

    'valid playing iswin ply toplay winner free' =. analyze board
  end.

  NB. if. iswin do.
  NB.   echo winner , ' WINS'
  NB. else.
  NB.   echo 'DRAW'
  NB. end.

  < moves
)

isvalidp =: 0 pick analyze
validcodes =: (([: isvalidp"2 decode)#]) i. 29525
canvalidcodes =: sort ~. > canenc each decode each ;/ validcodes NB. Canonical valid codes
