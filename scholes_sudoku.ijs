NB. the indices of a three vector
i. 3

NB. a function for the indices of Omega to the power two where Omega is three
([: i. ^&2) 3

NB. the three Row three column reshape of the numbers
([: i. 2&#) 3

NB. the three row item replication
(]#"1[: i. 2&#) 3

NB. and the three column item replication
(]#]#"1[: i. 2&#) 3

NB. "box" denotes a function for the box numbers of a 9 by 9 Sudoku puzzle
box =: ]#]#"1[: i. 2&#

NB. we'll start with a smaller four by four puzzle
box 2

NB. the row-column indices of a four by four array
([: <@,"0/~ i.) 4

NB. the join of each cell with its box number, where "box" takes the first
NB. item of Omega to the power 1r2
(([: <@,"0/~ i.) ,&.> [: box %:) 4
 4
NB. row column box numbers for each cell
rcb =: ([: <@,"0/~ i.) ,&.> [: box %:

NB. row column box numbers for a four by four puzzle
rcb 4

NB. itemwise comparison with a cell containing three three four (-> 2 2 3)
(<"_2) 2 2 3 (="1 1) >rcb 4 NB. NOTE: Sytax can almost certainly be improved

NB. there is contention where one is a member of each cell
1 e. &.> (<"_2) 2 2 3 (="1 1) >rcb 4

NB. the outer product comparison with all cells is a rank four array

NB. enclosing the first two axes the shape of the shape produces a 4 by 4 map of 4 by 4 contention matrices

NB. cmap denotes a function for the contention map

NB. here's a contention map for a four by four puzzle

NB. here is a four by four Sudoku puzzle with zeros representing blank squares

NB. the shape of the puzzle

NB. a contention map for the puzzle

NB. the third row second column left argument cell selection

NB. the cell item is a contention mask

NB. the puzzle again

NB. numbers in contention with a cell at (3 2)

NB. all numbers 1 to 4 without the contention numbers

NB. numbers available to cell (1 1) in puzzle s44

NB. left and right function arguments

NB. we can have a left inner operand (3 2) addressed by double alpha the negative 3 2 take of 88

NB. the shape of the puzzle take plus the puzzle values denotes an operator for alpha at alpha alpha in omega

NB. 99 at 1 1 in s44

NB. numbers available at 1 1 in s44

NB. each number at cell 1 1 in cell s44

NB. replacement vector force l11 in s4 for
NB. here is a tutu bound placement for each
NB. the join of the placements placements
NB. for sale to one rationalizing the
NB. rightmost segment the join of one one
NB. bound with pivec applied to each item of
NB. the cell s4 for abstracting this as a
NB. vector of placements we can rewrite the
NB. above expression
NB. or expressed as a reduction of a three
NB. vector of cells joined with a Cell item
NB. the cell s4 for including a further
NB. empty cell here's the puzzle s4 for its
NB. shape a matrix of row column indices a
NB. vector of indices cells that are blank
NB. in s4 for a vector ax blanks the zero
NB. one replication of the index vector a
NB. vector of the empty cells in s4 for
NB. using all of the empty cells we have a
NB. solution vector for the puzzle s4 for
NB. however this coding is inefficient s
NB. Veck folds peeve x over empty cells
NB. peeve x applies pv for each placement
NB. pivec applies a AVL for each available
NB. number and AVL calculates the same value
NB. for sima parsy B each time we'll
NB. calculate C map RC B Rho Omega just once
NB. in s Veck and pass it as an inner upper
NB. and alpha alpha to P Veck and inner
NB. offer and alpha alpha to AVL and receive
NB. it as alpha alpha in AVL so the effect
NB. is the same now here is a nine by nine
NB. Sudoku puzzle and it's solution vector
NB. and here is a final APL code try it for
NB. yourself at WWII PL org
