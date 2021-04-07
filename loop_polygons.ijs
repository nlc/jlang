NB. Which regular polygons can be connected edgewise in a perfectly closed loop
NB. which perfectly encoses another regular polygon?

NB. sia =: 180 * _2&+ NB. Sum of Interior Angles
NB. iafn =: %~ sia NB. Interior Angle From Number of sides

iafn =: 180 * [: >: _2r1&%
nfia =: 360 % 180&-
ia =: iafn :. nfia

opa =: 360 - [: +: ia NB. Outer "Pincer" Angle formed by two edge-connected polygons
NB. really just 2 * exterior angle now that I think about it

is_int=:0 = 1&| NB. is x an integer?

NB. loop is formed by polygon N when
NB. exists natural M s.t. opa(N) = ia(M)
NB. equivalently when
NB. is_int( ia^:_1( opa( N ) ) )

NB. HA! ([: nfia opa) >: i. 10 gives
NB. _2r3 _2 _6 _ 10 6 14r3 4 18r5 10r3
NB. Note the _ in the fourth spot, due to the fact that squares laid end to end
NB. can go on forever

(]#~([: is_int [: ia^:_1 opa)) 1 2 3 , 5 + i. 10000
NB. gives us the qualifying numbers above the problematic 4
NB. re-adding 4 to the list gives: 2 3 4 5 6 8 12
NB. However, we must eliminate 2, since a polygon must have at
NB. least 3 sides, and 3, since the "loop" of equilateral
NB. triangles is actually a perfect tesselation with no
NB. central gap. Thus:
NB. 4 5 6 8 12

NB. Note that once ia^:_1 N falls monotonically and once it
NB. is below 3 (i.e. N>12) there are no more regular polygons to be formed

NB. Thus the above list is in fact complete.
