NB. Generate next iteration of dragon curve
iter =: ,0:,[:|.-.

NB. Generate 2D rotation matrix, given an angle in rads
rotmat=:2 2 $ 1 _1 1 1 * 2 1 1 2&o.

NB. add third dim. for extra translation goodness
rotmat=: 1 (< 2 2) } 3 3 {. 2 2 $ 1 _1 1 1 * 2 1 1 2&o.
