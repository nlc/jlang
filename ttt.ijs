omo =: 3 3 $ 0
omx =: 3 3 $ 0

wins =: 8 9 $ 1 0 0 1 0 0 1 0 0 0 0 1 0 0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 0 1 0 0 0 1 0 0 1 0 1 0 1 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0

NB. displays board and eliminates overlap
'.XO' {~ omx (XOR * [ + [: +: ]) omo

NB. displays board
'-XO'{~omx++:omo

NB. overlap =: OR/^:_ omx AND omo
overlap =: [: OR/@, AND NB. Maybe? I think so.

NB. check omx against wins
OR/ AND/"1 wins ([=AND"1) (,omx)

endstate =: 'Cat''s game' ; 'X wins' ; 'O wins' ; 'Error'

haswon =: 3 : 'OR/ AND/"1 wins ([=AND"1) , y'

NB. detect and print end state (assumes game is over)
endstate pick~ +/ 1 2 * haswon "2 omx ,: omo


NB. The beginnings of another way to detect wins
p =: p: i. 2 3 3
m =: 2 3 3 $ 0 0 1 0 1 0 1 0 1 0 0 0 0 0 0 0 0 0 NB. or whatever
pnz =: */@(#~|@*)@, NB. Product of Non-Zero elements
state =: pnz p * m
NB. and then wins can be found by testing divisibility.
NB. e.g. a diagonal of (X?)s from top-right to bottom-left is 935 = 5 * 11 * 17
NB. if the product of all nonzero elements is divisible by 935, then that
NB. pattern is present.
awc =: pnz"2 (p) *"2/ (8 3 3 ($,) wins) NB. All Win Conditions
