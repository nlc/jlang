omo =. 3 3 $ 0
omx =. 3 3 $ 0

wins =. 8 9 $ 1 0 0 1 0 0 1 0 0 0 0 1 0 0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 0 1 0 0 0 1 0 0 1 0 1 0 1 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0

NB. displays board and eliminates overlap
'.XO' {~ omx (XOR * [ + [: +: ]) omo

NB. displays board
'-XO'{~omx++:omo

overlap =. OR/^:_ omx AND omx
overlap =. [: OR/@, AND NB. Maybe? I think so.

NB. check omx against wins
OR/ AND/"1 wins ([=AND"1) (,omx)

endstate =. 'Cats game' , 'X wins' , 'O wins' ,: 'Error'

haswon =. 3 : 'OR/ AND/"1 wins ([=AND"1) , y'

NB. detect and print end state (assumes game is over)
endstate {~ +/ 1 2 * haswon "2 omx ,: omx
