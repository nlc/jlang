require 'odometer.ijs'

rim =: _1&$: :(4 : 'x ,. (x , y , x) ,. x') NB. per Hui
boardmask =: 0 rim^:2 [ 8 8 $ 1 NB. board with 2-square border of zeros

knightsmoves =: ,/ (<:@+:@odometer 2 2) *"1/ (,.|.) 1 2

NB. location on board (with 2-square border)
(< 2 2) ="0 {;~ i. 12

NB. Possible knight's moves from the top left square
NB. this can almost certainly be done with "e."
currentpossiblemoves =: +/ (<"1 knightsmoves +"(1) 2 2) ="0 2 {;~ i. 12
