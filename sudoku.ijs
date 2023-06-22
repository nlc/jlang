sud =: 4 4 $ 0 0 0 4 0 0 0 0 2 0 0 3 4 0 1 2

NB. Boxes of possible values
(1 2 3 4&[`])@.* each <"0 sud

without =: -.@e. # [

box =: ]#"1]#i.@(2#]

NB. row and column numbers
rc =: [: <@,"0/~ i.

NB. Row/Column/Box number
rcb =: (box %:),~each rc

NB. "Item-wise comparison with a cell containing 2 2 3"
((< 2 2 3) = each rcb) 4

NB. "There is contention where 1 is a member of each cell"
(1 e. each (< 2 2 3) = each rcb) 4

NB. "The outer-product comparison with all cells is a rank-4 array"
>"0 (1 e.each [ =each ])"0/~ rcb 4

NB. "Enclosing the first 2 axes the shape of the shape produces a 4x4 map of 4x4 contention matrices"
<"2 >"0 (1 e.each [ =each ])"0/~ rcb 4

NB. "cmap denotes a function for the contention map"
cmap =: [: <"2 [: > (1 e.&.> [ =&.> ])"0/~

NB. "Here's a contention map for a 4x4 puzzle."
cmap rcb 4

NB. "Here is a 4x4 sudoku puzzle with zeros representing blank squares."
s44 =: 4 4 $ 0 0 0 0 0 0 2 1 3 0 0 4 0 0 0 0
