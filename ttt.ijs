omo =: 3 3 $ 0
omx =: 3 3 $ 0

wins =: 8 9 $ 1 0 0 1 0 0 1 0 0 0 0 1 0 0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 0 1 0 0 0 1 0 0 1 0 1 0 1 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0

NB. displays board and eliminates overlap
'.XO' {~ omx (XOR * [ + [: +: ]) omo

NB. displays board
'-XO'{~omx++:omo

overlap =: OR/^:_ omx AND omx
overlap =: [: OR/@, AND NB. Maybe? I think so.

NB. check omx against wins
OR/ AND/"1 wins ([=AND"1) (,omx)

endstate =: 'Cats game' , 'X wins' , 'O wins' ,: 'Error'

haswon =: 3 : 'OR/ AND/"1 wins ([=AND"1) , y'

NB. detect and print end state (assumes game is over)
endstate {~ +/ 1 2 * haswon "2 omx ,: omx


NB. The beginnings of another way to detect wins
p =: p: 2 3 3
m =: 3 3 $ 0 0 1 0 1 0 1 0 1 NB. or whatever
state =: */^:_ +/ p * m ,: -. m
NB. and then wins can be found by testing divisibility.
NB. e.g. a row of (X?)s across the top is 2 * 3 * 5 = 30. if it's div. by 30
NB. then that pattern is present.
