require 'format/printf'

winlocs =: (i. 3 3) e."(2 1) 8 3 $ 0 1 2 3 4 5 6 7 8 0 3 6 1 4 7 2 5 8 0 4 8 2 4 6
winscan =: winlocs #&,"2 ]

boardpattern =: (39 $ '%c|%c|%c' , LF , '-+-+-' , LF)

game =: 3 3 $ 'O X OXXOX'

analyze =: 3 : 0
  board =. y

  winstate =. #. (2 3 $ 'XXXOOO') e."1 2 winscan board
  valid =. winstate < 3
  iswin =. winstate e. 1 2
  winner =. winstate { ' OX '

  occupancy =. 'OX' e.~"1 0 , board
  free =. I. -. occupancy
  ply =. +/ occupancy
  toplay =. 'XO' {~ 2 | ply

  valid ; ply ; toplay ; iswin ; winner ; free
)
