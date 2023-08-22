omo =: 3 3 $ 0
omx =: 3 3 $ 0

wins =: 8 9 $ 1 0 0 1 0 0 1 0 0 0 0 1 0 0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 0 1 0 0 0 1 0 0 1 0 1 0 1 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0

wins2 =: (i. 3 3) e."(2 1) 8 3 $ 0 1 2 3 4 5 6 7 8 0 3 6 1 4 7 2 5 8 0 4 8 2 4 6
NB. wins2 (#&,)"2 game NB. where game is a 3x3 matrix of Xs and Os

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

NB. Another way to detect wins
p =: p: i. 2 3 3
m =: 2 3 3 $ 0 0 1 0 1 0 1 0 1 0 0 0 0 0 0 0 0 0 NB. or whatever
pnz =: */@(#~|@*)@, NB. Product of Non-Zero elements
state =: pnz p * m
NB. and then wins can be found by testing divisibility.
NB. e.g. a diagonal of (X?)s from top-right to bottom-left is 935 = 5 * 11 * 17
NB. if the product of all nonzero elements is divisible by 935, then that
NB. pattern is present.
awc =: pnz"2 (p) *"2/ (8 3 3 ($,) wins) NB. All Win Conditions
echo OR/"(1) 0 = awc | state

NB. all states expressed as products of primes to the power 0, 1 or 2 for ' XO'
*/"1 (p: i. 9)^"(1) 3#.^:_1 i. 3^9
